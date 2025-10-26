//
//  MovieDetail.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
  let id: Int
  let title: String
  let overview: String
  let posterPath: String?
  let backdropPath: String?
  let voteAverage: Double
  let voteCount: Int
  let releaseDate: String
  let genres: [Genre]
  let runtime: Int?
  let budget: Int?
  let revenue: Int?
  let tagline: String?
  let status: String?
  let originalLanguage: String?
  let originalTitle: String?
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case overview
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case releaseDate = "release_date"
    case genres
    case runtime
    case budget
    case revenue
    case tagline
    case status
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
  }
  
  var posterURL: URL? {
    guard let posterPath else { return nil }
    return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
  }
  
  var backdropURL: URL? {
    guard let backdropPath else { return nil }
    return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath)")
  }
  
  var ratingText: String {
    String(format: "%.1f", voteAverage)
  }
  
  var year: String {
    String(releaseDate.prefix(4))
  }
  
  var runtimeText: String? {
    guard let runtime = runtime else { return nil }
    let hours = runtime / 60
    let minutes = runtime % 60
    return "\(hours)s \(minutes)dk"
  }
}
