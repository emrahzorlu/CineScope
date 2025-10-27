//
//  MovieCardView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
  let movie: Movie
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      KFImage(movie.posterURL)
        .fade(duration: 0.3)
        .placeholder {
          Rectangle()
            .fill(Color.gray.opacity(0.3))
            .overlay(
              ProgressView()
                .tint(.white)
            )
        }
        .resizable()
        .scaledToFill()
        .frame(width: 120, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      
      VStack(alignment: .leading, spacing: 4) {
        Text(movie.title)
          .font(.caption)
          .fontWeight(.medium)
          .foregroundColor(.white)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, 8)
        
        HStack(spacing: 4) {
          Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .font(.caption2)
          Text(movie.ratingText)
            .font(.caption2)
            .foregroundColor(.gray)
        }
      }
      
      Spacer(minLength: 0)
    }
    .frame(width: 120, height: 240)
  }
}

#Preview {
  HStack(spacing: 16) {
    MovieCardView(movie: MockData.sampleMovie1)
    MovieCardView(movie: Movie(
      id: 2,
      title: "Film",
      overview: "",
      posterPath: "/test.jpg",
      backdropPath: nil,
      voteAverage: 8.5,
      releaseDate: "2024-01-01",
      genreIds: []
    ))
  }
  .background(Color.black)
}
