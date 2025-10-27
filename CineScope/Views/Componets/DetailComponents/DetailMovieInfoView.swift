//
//  DetailMovieInfoView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct DetailMovieInfoView: View {
  let movie: Movie
  let movieDetail: MovieDetail?
  let hasTrailer: Bool
  let isFavorite: Bool
  let onPlayTapped: () -> Void
  let onAddToListTapped: () -> Void
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(movieDetail?.title ?? movie.title)
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .fixedSize(horizontal: false, vertical: true)
      
      if let genres = movieDetail?.genres, !genres.isEmpty {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 8) {
            ForEach(genres) { genre in
              Text(genre.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
            }
          }
        }
      }
      
      HStack(spacing: 12) {
        HStack(spacing: 4) {
          Image(systemName: "star.fill")
            .foregroundColor(.yellow)
          Text(movie.ratingText)
            .foregroundColor(.white)
        }
        
        Text("•")
          .foregroundColor(.gray)
        
        Text(movie.year)
          .foregroundColor(.gray)
        
        if let runtime = movieDetail?.runtimeText {
          Text("•")
            .foregroundColor(.gray)
          Text(runtime)
            .foregroundColor(.gray)
        }
      }
      .font(.subheadline)
      .padding(.top, 4)
      
      HStack(spacing: 12) {
        Button(action: onPlayTapped) {
          HStack(spacing: 8) {
            Image(systemName: "play.fill")
            Text("Fragmanı İzle")
              .fontWeight(.semibold)
          }
          .frame(maxWidth: .infinity)
          .padding(.vertical, 12)
          .background(Color.white)
          .foregroundColor(.black)
          .cornerRadius(8)
        }
        
        Button(action: onAddToListTapped) {
          HStack(spacing: 8) {
            Image(systemName: isFavorite ? "checkmark" : "plus")
              .font(.system(size: 16, weight: .semibold))
            Text("Listem")
              .fontWeight(.semibold)
          }
          .padding(.horizontal, 16)
          .padding(.vertical, 12)
          .background(isFavorite ? Color.white : Color.gray.opacity(0.3))
          .foregroundColor(isFavorite ? .black : .white)
          .cornerRadius(8)
        }
      }
      .padding(.top, 8)
      
      if let overview = movieDetail?.overview, !overview.isEmpty {
        VStack(alignment: .leading, spacing: 8) {
          Text("Özet")
            .font(.headline)
            .foregroundColor(.white)
          
          Text(overview)
            .font(.body)
            .foregroundColor(.gray)
            .lineSpacing(4)
        }
        .padding(.top, 8)
      }
    }
    .padding()
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    DetailMovieInfoView(
      movie: Movie(
        id: 1,
        title: "Test Film",
        overview: "Test",
        posterPath: nil,
        backdropPath: nil,
        voteAverage: 8.5,
        releaseDate: "2024-01-01",
        genreIds: []
      ),
      movieDetail: nil,
      hasTrailer: true,
      isFavorite: false,
      onPlayTapped: {},
      onAddToListTapped: {}
    )
  }
}
