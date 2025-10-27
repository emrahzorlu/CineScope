//
//  SearchViewModel.swift
//  CineScope
//
//  Created by Emrah Zorlu on 27.10.2025.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
  @Published var searchText = ""
  @Published var movies: [Movie] = []
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  private let tmdbService = TMDBService.shared
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupSearch()
  }
  
  private func setupSearch() {
    $searchText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .removeDuplicates()
      .sink { [weak self] query in
        Task {
          await self?.performSearch(query: query)
        }
      }
      .store(in: &cancellables)
  }
  
  private func performSearch(query: String) async {
    guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
      movies = []
      errorMessage = nil
      return
    }
    
    isLoading = true
    errorMessage = nil
    
    do {
      let response = try await tmdbService.searchMovies(query: query)
      self.movies = response.results
      
      if response.results.isEmpty {
        errorMessage = "'\(query)' için sonuç bulunamadı"
      }
    } catch {
      errorMessage = "Arama sırasında hata oluştu: \(error.localizedDescription)"
      movies = []
    }
    
    isLoading = false
  }
}
