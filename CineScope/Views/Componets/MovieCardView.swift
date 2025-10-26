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
    VStack(alignment: .leading, spacing: 8) {
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
      
      Text(movie.title)
        .font(.caption)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .lineLimit(2)
        .multilineTextAlignment(.leading)
        .frame(width: 120, height: 32, alignment: .topLeading)
      
      HStack(spacing: 4) {
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
          .font(.caption2)
        Text(movie.ratingText)
          .font(.caption2)
          .foregroundColor(.gray)
      }
    }
    .frame(width: 120)
  }
}

#Preview {
  MovieCardView(movie: MockData.sampleMovie1)
}
