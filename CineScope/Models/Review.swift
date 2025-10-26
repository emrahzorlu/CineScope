//
//  Review.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct Review: Codable, Identifiable {
  let id: String
  let author: String
  let content: String
  let createdAt: String
  let updatedAt: String
  let url: URL?
  let authorDetails: AuthorDetails
  
  enum CodingKeys: String, CodingKey {
    case id
    case author
    case content
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case url
    case authorDetails = "author_details"
  }
  
  var excerpt: String {
    if content.count > 200 {
      return String(content.prefix(200)) + "..."
    }
    return content
  }
  
  var formattedDate: String {
    let formatter = ISO8601DateFormatter()
    if let date = formatter.date(from: createdAt) {
      let displayFormatter = DateFormatter()
      displayFormatter.dateFormat = "d MMM yyyy"
      displayFormatter.locale = Locale(identifier: "tr_TR")
      return displayFormatter.string(from: date)
    }
    return String(createdAt.prefix(10))
  }
}

struct AuthorDetails: Codable {
  let name: String?
  let username: String
  let avatarPath: String?
  let rating: Double?
  
  enum CodingKeys: String, CodingKey {
    case name
    case username
    case avatarPath = "avatar_path"
    case rating
  }
  
  var avatarURL: URL? {
    guard let avatarPath else { return nil }
    
    if avatarPath.hasPrefix("/https://") {
      let cleanPath = String(avatarPath.dropFirst())
      return URL(string: cleanPath)
    }
    
    return URL(string: "https://image.tmdb.org/t/p/w185\(avatarPath)")
  }
  
  var ratingText: String? {
    guard let rating = rating else { return nil }
    return String(format: "%.1f", rating)
  }
}

struct ReviewResponse: Codable {
  let id: Int
  let page: Int
  let results: [Review]
  let totalPages: Int
  let totalResults: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
  
  var topReviews: [Review] {
    Array(results.prefix(5))
  }
}
