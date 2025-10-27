//
//  FavoritesView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct FavoritesView: View {
  @StateObject private var favoritesManager = FavoritesManager.shared
  
  var body: some View {
    NavigationStack {
      ZStack {
        BackGroundView()
          .ignoresSafeArea()
        
        if favoritesManager.favorites.isEmpty {
          EmptyFavoritesView()
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
              ForEach(favoritesManager.favorites) { movie in
                NavigationLink(value: movie) {
                  FavoriteMovieCard(movie: movie)
                }
              }
            }
            .padding()
            .padding(.bottom, 100)
          }
        }
      }
      .navigationTitle("Listem")
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

// MARK: - Empty Favorites View
struct EmptyFavoritesView: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "rectangle.stack.badge.plus")
        .font(.system(size: 80))
        .foregroundColor(.gray.opacity(0.5))
      
      Text("Listeniz Boş")
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.white)
      
      Text("Beğendiğiniz filmleri\nlistenize ekleyin")
        .font(.subheadline)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
    }
    .frame(maxHeight: .infinity)
  }
}

// MARK: - Favorite Movie Card
struct FavoriteMovieCard: View {
  let movie: Movie
  @StateObject private var favoritesManager = FavoritesManager.shared
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      ZStack(alignment: .topTrailing) {
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
        
        Button {
          withAnimation {
            favoritesManager.removeFavorite(movie)
          }
        } label: {
          Image(systemName: "checkmark")
            .foregroundColor(.white)
            .padding(8)
            .background(Color.green)
            .clipShape(Circle())
        }
        .padding(8)
      }
      
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
      
      Spacer(minLength: 0)
    }
    .frame(height: 240)
  }
}

#Preview {
  FavoritesView()
}
