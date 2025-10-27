//
//  Movie.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
  let id: Int
  let title: String
  let overview: String
  let posterPath: String?
  let backdropPath: String?
  let voteAverage: Double
  let releaseDate: String
  let genreIds: [Int]?
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case overview
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
    case voteAverage = "vote_average"
    case releaseDate = "release_date"
    case genreIds = "genre_ids"
  }
  
  var posterURL: URL? {
    guard let posterPath else { return nil }
    
    return URL(string: "https://image.tmdb.org/t/p/original\(posterPath)")
  }
  
  var backdropURL: URL? {
    guard let backdropPath else { return nil }
    
    return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath)")
  }
  
  var ratingText: String {
    return String(format: "%.1f", voteAverage)
  }
  
  var year: String {
    String(releaseDate.prefix(4))
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Movie, rhs: Movie) -> Bool {
    lhs.id == rhs.id
  }
}
