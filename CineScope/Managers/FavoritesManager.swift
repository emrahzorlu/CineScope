//
//  FavoritesManager.swift
//  CineScope
//
//  Created by Emrah Zorlu on 27.10.2025.
//

import Foundation

final class FavoritesManager: ObservableObject {
  static let shared = FavoritesManager()
  
  @Published private(set) var favorites: [Movie] = []
  
  private let favoritesKey = "favorites"
  private let userDefaults = UserDefaults.standard
  
  private init() {
    loadFavorites()
  }
  
  // MARK: - Load
  private func loadFavorites() {
    guard let data = userDefaults.data(forKey: favoritesKey),
          let decoded = try? JSONDecoder().decode([Movie].self, from: data) else {
      favorites = []
      return
    }
    favorites = decoded
  }
  
  // MARK: - Save
  private func saveFavorites() {
    guard let encoded = try? JSONEncoder().encode(favorites) else { return }
    userDefaults.set(encoded, forKey: favoritesKey)
  }
  
  // MARK: - Add
  func addFavorite(_ movie: Movie) {
    guard !isFavorite(movie) else { return }
    favorites.append(movie)
    saveFavorites()
  }
  
  // MARK: - Remove
  func removeFavorite(_ movie: Movie) {
    favorites.removeAll { $0.id == movie.id }
    saveFavorites()
  }
  
  // MARK: - Toggle
  func toggleFavorite(_ movie: Movie) {
    if isFavorite(movie) {
      removeFavorite(movie)
    } else {
      addFavorite(movie)
    }
  }
  
  // MARK: - Check
  func isFavorite(_ movie: Movie) -> Bool {
    favorites.contains { $0.id == movie.id }
  }
}
