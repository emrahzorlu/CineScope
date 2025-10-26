//
//  Credits.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct Cast: Codable, Identifiable {
  let id: Int
  let name: String
  let character: String
  let profilePath: String?
  let order: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case character
    case profilePath = "profile_path"
    case order
  }
  
  var profileURL: URL? {
    guard let profilePath else { return nil }
    return URL(string: "https://image.tmdb.org/t/p/w185\(profilePath)")
  }
}

struct Crew: Codable, Identifiable {
  let id: Int
  let name: String
  let job: String
  let department: String
  let profilePath: String?
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case job
    case department
    case profilePath = "profile_path"
  }
  
  var profileURL: URL? {
    guard let profilePath else { return nil }
    return URL(string: "https://image.tmdb.org/t/p/w185\(profilePath)")
  }
  
  var isDirector: Bool {
    job == "Director"
  }
  
  var isWriter: Bool {
    job == "Writer" || job == "Screenplay"
  }
}

struct CreditsResponse: Codable {
  let id: Int
  let cast: [Cast]
  let crew: [Crew]
  
  var mainCast: [Cast] {
    Array(cast.prefix(10))
  }
  
  var directors: [Crew] {
    crew.filter { $0.isDirector }
  }
  
  var writers: [Crew] {
    crew.filter { $0.isWriter }
  }
  
  var producers: [Crew] {
    crew.filter { $0.job == "Producer" }
  }
}
