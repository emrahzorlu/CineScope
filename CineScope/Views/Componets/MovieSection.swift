//
//  MovieSection.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct MovieSection: View {
  let title: String
  let movies: [Movie]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(title)
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(.horizontal)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          ForEach(movies) { movie in
            NavigationLink(value: movie) {  // ← NavigationLink eklendi
              MovieCardView(movie: movie)
            }
            .buttonStyle(.plain)  // ← Button stilini kaldır (mavi renk olmasın)
          }
        }
        .padding()
      }
    }
  }
}

#Preview {
  NavigationStack {  // ← Preview için NavigationStack
    MovieSection(title: "Test Section", movies: MockData.popularMovies)
  }
}
