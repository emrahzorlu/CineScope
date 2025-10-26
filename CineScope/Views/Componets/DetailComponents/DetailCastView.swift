//
//  DetailCastView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI
import Kingfisher

struct DetailCastView: View {
  let cast: [Cast]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Oyuncular")
        .font(.headline)
        .foregroundColor(.white)
        .padding(.horizontal)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 16) {
          ForEach(cast) { actor in
            CastCardView(actor: actor)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct CastCardView: View {
  let actor: Cast
  
  var body: some View {
    VStack(spacing: 8) {
      // Profile Photo
      KFImage(actor.profileURL)
        .fade(duration: 0.3)
        .placeholder {
          Circle()
            .fill(Color.gray.opacity(0.3))
            .overlay(
              Image(systemName: "person.fill")
                .foregroundColor(.gray)
            )
        }
        .resizable()
        .scaledToFill()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
      
      // Name
      Text(actor.name)
        .font(.caption)
        .fontWeight(.medium)
        .foregroundColor(.white)
        .lineLimit(2)
        .multilineTextAlignment(.center)
        .fixedSize(horizontal: false, vertical: true)  // ← Dinamik yükseklik
      
      // Character
      Text(actor.character)
        .font(.caption2)
        .foregroundColor(.gray)
        .lineLimit(1)
    }
    .frame(width: 80)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    DetailCastView(cast: MockData.sampleCast)
  }
}
