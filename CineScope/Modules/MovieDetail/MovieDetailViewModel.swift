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
      
      // DEBUG: Videos kontrolü
      print("🎬 Videos API Response:")
      print("  - Movie ID: \(movieId)")
      print("  - Total Videos: \(videosResponse.results.count)")
      
      if !videosResponse.results.isEmpty {
        print("  ✅ Videolar:")
        for (index, video) in videosResponse.results.enumerated() {
          print("    \(index + 1). \(video.name)")
          print("       Type: \(video.type)")
          print("       Site: \(video.site)")
          print("       Key: \(video.key)")
          print("       Official: \(video.official)")
          print("       Is Trailer: \(video.isTrailer)")
        }
        
        let trailers = videosResponse.trailers
        print("  🎥 Trailers: \(trailers.count)")
        for trailer in trailers {
          print("    - \(trailer.name)")
          print("      YouTube URL: \(trailer.youtubeURL?.absoluteString ?? "nil")")
        }
      } else {
        print("  ⚠️ Bu filmde video yok!")
      }
      
    } catch {
      errorMessage = "Hata: \(error.localizedDescription)"
      print("❌ API Error: \(error)")
    }
    
    isLoading = false
  }
}
