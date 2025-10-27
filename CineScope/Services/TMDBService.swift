//
//  TMDBService.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

class TMDBService {
  static let shared = TMDBService()
  
  private init() {}
  
  private let apiKey = Bundle.main.tmdbAPIKey
  private let baseURL = "https://api.themoviedb.org/3"
  
  // MARK: - Generic Request
  private func request<T: Codable>(
    endpoint: String,
    parameters: [String: String] = [:]
  ) async throws -> T {
    
    guard var components = URLComponents(string: "\(baseURL)\(endpoint)") else {
      throw URLError(.badURL)
    }
    
    var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
    queryItems += parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    
    components.queryItems = queryItems
    
    guard let url = components.url else {
      throw URLError(.badURL)
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
      throw URLError(.badServerResponse)
    }
    
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  }
  
  // MARK: - Movie Lists
  func fetchPopularMovies() async throws -> MovieResponse {
    try await request(endpoint: "/movie/popular", parameters: ["language": "tr-TR"])
  }
  
  func fetchTrendingMovies() async throws -> MovieResponse {
    try await request(endpoint: "/trending/movie/week", parameters: ["language": "tr-TR"])
  }
  
  func fetchNowPlayingMovies() async throws -> MovieResponse {
    try await request(endpoint: "/movie/now_playing", parameters: ["language": "tr-TR", "region": "TR"])
  }
  
  func fetchUpcomingMovies() async throws -> MovieResponse {
    try await request(endpoint: "/movie/upcoming", parameters: ["language": "tr-TR", "region": "TR"])
  }
  
  func fetchTopRatedMovies() async throws -> MovieResponse {
    try await request(endpoint: "/movie/top_rated", parameters: ["language": "tr-TR"])
  }
  
  // MARK: - Search
  func searchMovies(query: String) async throws -> MovieResponse {
    try await request(endpoint: "/search/movie", parameters: ["language": "tr-TR", "query": query])
  }
  
  // MARK: - Movie Details
  func fetchMovieDetails(id: Int) async throws -> MovieDetail {
    try await request(endpoint: "/movie/\(id)", parameters: ["language": "tr-TR"])
  }
  
  // MARK: - Videos (Fragmanlar)
  func fetchMovieVideos(movieId: Int) async throws -> VideoResponse {
    try await request(endpoint: "/movie/\(movieId)/videos", parameters: ["language": "tr-TR"])
  }
  
  // MARK: - Credits (Cast & Crew)
  func fetchMovieCredits(movieId: Int) async throws -> CreditsResponse {
    try await request(endpoint: "/movie/\(movieId)/credits", parameters: ["language": "tr-TR"])
  }
  
  // MARK: - Similar Movies
  func fetchSimilarMovies(movieId: Int) async throws -> MovieResponse {
    try await request(endpoint: "/movie/\(movieId)/similar", parameters: ["language": "tr-TR"])
  }
  
  // MARK: - Reviews (Yorumlar)
  func fetchMovieReviews(movieId: Int) async throws -> ReviewResponse {
    try await request(endpoint: "/movie/\(movieId)/reviews", parameters: [:])
  }
}
