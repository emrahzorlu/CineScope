//
//  HomeViewModel.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
  static let shared = HomeViewModel()
  
  @Published var trendingMovies: [Movie] = []
  @Published var popularMovies: [Movie] = []
  @Published var nowPlayingMovies: [Movie] = []
  @Published var topRatedMovies: [Movie] = []
  
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  private let tmdbService = TMDBService.shared
  private var hasLoadedOnce = false
  
  private init() {}
  
  func loadMovies() async {
    if hasLoadedOnce && !trendingMovies.isEmpty {
      return
    }
    
    isLoading = true
    errorMessage = nil
    
    do {
      async let trending = tmdbService.fetchTrendingMovies()
      async let popular = tmdbService.fetchPopularMovies()
      async let nowPlaying = tmdbService.fetchNowPlayingMovies()
      async let topRated = tmdbService.fetchTopRatedMovies()
      
      let (trendingResponse, popularResponse, nowPlayingResponse, topRatedResponse) = try await (trending, popular, nowPlaying, topRated)
      
      self.trendingMovies = trendingResponse.results
      self.popularMovies = popularResponse.results
      self.nowPlayingMovies = nowPlayingResponse.results
      self.topRatedMovies = topRatedResponse.results
      
      hasLoadedOnce = true
      
    } catch {
      errorMessage = "Hata: \(error.localizedDescription)"
    }
    
    isLoading = false
  }
  
  func forceRefresh() async {
    hasLoadedOnce = false
    await loadMovies()
  }
}
