//
//  SearchView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct SearchView: View {
  @StateObject private var viewModel = SearchViewModel()
  
  var body: some View {
    NavigationStack {
      ZStack {
        BackGroundView()
          .ignoresSafeArea()
        
        VStack(spacing: 0) {
          // Search Bar
          HStack {
            HStack {
              Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
              
              TextField("Film ara...", text: $viewModel.searchText)
                .foregroundColor(.white)
                .autocorrectionDisabled()
              
              if !viewModel.searchText.isEmpty {
                Button {
                  viewModel.searchText = ""
                } label: {
                  Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                }
              }
            }
            .padding(12)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
          }
          .padding()
          
          // Content
          if viewModel.searchText.isEmpty {
            EmptySearchView()
          } else if viewModel.isLoading {
            ProgressView()
              .scaleEffect(1.5)
              .tint(.white)
              .frame(maxHeight: .infinity)
          } else if let error = viewModel.errorMessage {
            VStack(spacing: 16) {
              Image(systemName: "magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.gray)
              
              Text(error)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            }
            .frame(maxHeight: .infinity)
            .padding()
          } else {
            ScrollView {
              LazyVGrid(
                columns: [
                  GridItem(.flexible()),
                  GridItem(.flexible()),
                  GridItem(.flexible())
                ],
                spacing: 16
              ) {
                ForEach(viewModel.movies) { movie in
                  NavigationLink(value: movie) {
                    SearchMovieCard(movie: movie)
                  }
                }
              }
              .padding()
              .padding(.bottom, 100)
            }
          }
        }
      }
      .navigationTitle("Ara")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
      .toolbarColorScheme(.dark, for: .navigationBar)
      .navigationDestination(for: Movie.self) { movie in
        MovieDetailView(movie: movie)
      }
    }
    .preferredColorScheme(.dark)
  }
}

// MARK: - Empty Search View
struct EmptySearchView: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "film")
        .font(.system(size: 80))
        .foregroundColor(.gray.opacity(0.5))
      
      Text("Film Ara")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.white)
      
      Text("Milyonlarca film arasından\naradığınızı bulun")
        .font(.subheadline)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
    .frame(maxHeight: .infinity)
  }
}

// MARK: - Search Movie Card
struct SearchMovieCard: View {
  let movie: Movie
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // Poster
      AsyncImage(url: movie.posterURL) { image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        Rectangle()
          .fill(Color.gray.opacity(0.3))
          .overlay(
            ProgressView()
              .tint(.white)
          )
      }
      .frame(height: 180)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      
      // Text ve Rating - poster'a yapışık
      VStack(alignment: .leading, spacing: 4) {
        Text(movie.title)
          .font(.caption)
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, 8)
        
        HStack(spacing: 4) {
          Image(systemName: "star.fill")
            .font(.caption2)
            .foregroundColor(.yellow)
          
          Text(movie.ratingText)
            .font(.caption2)
            .foregroundColor(.gray)
        }
      }
      
      // Spacer en altta - boşluk buraya
      Spacer(minLength: 0)
    }
    .frame(height: 240)
  }
}

#Preview {
  SearchView()
}
