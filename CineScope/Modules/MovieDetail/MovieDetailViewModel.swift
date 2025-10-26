//
//  MovieDetailViewModel.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

@MainActor
final class MovieDetailViewModel: ObservableObject {
  @Published var movieDetail: MovieDetail?
  @Published var videos: VideoResponse?
  @Published var credits: CreditsResponse?
  @Published var similarMovies: [Movie] = []
  @Published var reviews: ReviewResponse?
  
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  private let tmdbService = TMDBService.shared

  func loadDetails(for movieId: Int) async {
    isLoading = true
    errorMessage = nil
    
    do {
      async let details = tmdbService.fetchMovieDetails(id: movieId)
      async let videos = tmdbService.fetchMovieVideos(movieId: movieId)
      async let credits = tmdbService.fetchMovieCredits(movieId: movieId)
      async let similar = tmdbService.fetchSimilarMovies(movieId: movieId)
      async let reviews = tmdbService.fetchMovieReviews(movieId: movieId)
      
      let (detailResponse, videosResponse, creditsResponse, similarResponse, reviewsResponse) = try await (details, videos, credits, similar, reviews)
      
      self.movieDetail = detailResponse
      self.videos = videosResponse
      self.credits = creditsResponse
      self.similarMovies = similarResponse.results
      self.reviews = reviewsResponse
      
      // DEBUG: Reviews kontrolü
      print("🔍 Reviews API Response:")
      print("  - Movie ID: \(movieId)")
      print("  - Total Results: \(reviewsResponse.totalResults)")
      print("  - Total Pages: \(reviewsResponse.totalPages)")
      print("  - Current Page: \(reviewsResponse.page)")
      print("  - Results Count: \(reviewsResponse.results.count)")
      
      if !reviewsResponse.results.isEmpty {
        print("  ✅ Yorumlar:")
        for (index, review) in reviewsResponse.results.enumerated() {
          print("    \(index + 1). \(review.author) - Rating: \(review.authorDetails.rating ?? 0)")
          print("       Preview: \(String(review.content.prefix(100)))...")
        }
      } else {
        print("  ⚠️ Bu filmde yorum yok!")
      }
      
      // API URL'i print et (manuel kontrol için)
      print("  📍 API URL: https://api.themoviedb.org/3/movie/\(movieId)/reviews?language=tr-TR")
      
    } catch {
      errorMessage = "Hata: \(error.localizedDescription)"
      print("❌ API Error: \(error)")
    }
    
    isLoading = false
  }
}
