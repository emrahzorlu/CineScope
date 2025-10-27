//
//  DetailSimilarMoviesView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct DetailSimilarMoviesView: View {
  let movies: [Movie]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Benzer Filmler")
        .font(.headline)
        .foregroundColor(.white)
        .padding(.horizontal)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          ForEach(movies) { movie in
            NavigationLink(value: movie) {
              MovieCardView(movie: movie)
            }
            .buttonStyle(.plain)  
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

#Preview {
  NavigationStack { 
    ZStack {
      Color.black.ignoresSafeArea()
      
      DetailSimilarMoviesView(movies: MockData.trendingMovies)
    }
  }
}
