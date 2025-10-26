//
//  DetailGenresView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct DetailGenresView: View {
  let genres: [Genre]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Türler")
        .font(.headline)
        .foregroundColor(.white)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
          ForEach(genres) { genre in
            Text(genre.name)
              .font(.subheadline)
              .fontWeight(.medium)
              .foregroundColor(.white)
              .padding(.horizontal, 16)
              .padding(.vertical, 8)
              .background(
                Color.white.opacity(0.2)
              )
              .cornerRadius(20)
          }
        }
      }
    }
    .padding(.horizontal)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    DetailGenresView(genres: MockData.sampleGenres)
  }
}
