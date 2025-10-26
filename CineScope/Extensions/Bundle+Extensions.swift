//
//  Bundle+Extensions.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

extension Bundle {
  var tmdbAPIKey: String {
    guard let key = infoDictionary?["TMDB_API_KEY"] as? String,
          !key.isEmpty,
          key != "$(TMDB_API_KEY)" else {
      fatalError("❌ TMDB API Key not configured!")
    }
    return key
  }
}
