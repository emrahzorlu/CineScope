//
//  MovieVideo.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct MovieVideo: Codable, Identifiable {
  let id: String
  let key: String
  let name: String
  let site: String
  let type: String
  let official: Bool
  let publishedAt: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case key
    case name
    case site
    case type
    case official
    case publishedAt = "published_at"
  }
  
  var youtubeURL: URL? {
    guard site == "YouTube" else { return nil }
    return URL(string: "https://www.youtube.com/watch?v=\(key)")
  }
  
  var youtubeEmbedURL: URL? {
    guard site == "YouTube" else { return nil }
    return URL(string: "https://www.youtube.com/embed/\(key)")
  }
  
  var youtubeThumbnailURL: URL? {
    guard site == "YouTube" else { return nil }
    return URL(string: "https://img.youtube.com/vi/\(key)/hqdefault.jpg")
  }
  
  var isTrailer: Bool {
    type == "Trailer"
  }
}

struct VideoResponse: Codable {
  let id: Int
  let results: [MovieVideo]
  
  var trailers: [MovieVideo] {
    results.filter { $0.isTrailer }
  }
  
  var officialVideos: [MovieVideo] {
    results.filter { $0.official }
  }
}
