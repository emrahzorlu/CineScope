//
//  FeaturedMovieHeaderView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI
import Kingfisher

struct FeaturedMovieHeader: View {
  let movie: Movie
  
  var body: some View {
    ZStack(alignment: .bottom) {
      KFImage(movie.backdropURL)
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
        .frame(width: UIScreen.main.bounds.width, height: 500)
        .clipped()
      
      LinearGradient(
        colors: [
          .clear,
          .black.opacity(0.6),
          .black.opacity(0.9)
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      
      VStack(spacing: 8) {
        Text(movie.title)
          .font(.system(size: 32, weight: .bold))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .fixedSize(horizontal: false, vertical: true)
          .padding(.horizontal)
        
        HStack(spacing: 8) {
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
        }
        .font(.subheadline)
        
        HStack(spacing: 12) {
          Button {
          } label: {
            HStack(spacing: 8) {
              Image(systemName: "play.fill")
              Text("İzle")
                .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(8)
          }
          
          Button {
          } label: {
            HStack(spacing: 8) {
              Image(systemName: "plus")
              Text("Listem")
                .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.gray.opacity(0.3))
            .foregroundColor(.white)
            .cornerRadius(8)
          }
        }
        .padding(.horizontal)
        .padding(.top, 4)
      }
      .padding(.bottom, 24)
    }
    .frame(height: 500)
  }
}

#Preview {
  FeaturedMovieHeader(movie: MockData.sampleMovie1)
}
