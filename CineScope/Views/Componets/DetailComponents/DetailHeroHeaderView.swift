//
//  DetailHeroHeaderView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI
import Kingfisher

struct DetailHeroHeaderView: View {
  let backdropURL: URL?
  let onDismiss: (() -> Void)?
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .topLeading) {
        KFImage(backdropURL)
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
          .frame(width: geometry.size.width, height: 400)
          .clipped()
        
        LinearGradient(
          colors: [
            .black.opacity(0.3),
            .clear,
            .clear,
            .black.opacity(0.9)
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .frame(width: geometry.size.width, height: 400)
      }
    }
    .frame(height: 400)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    DetailHeroHeaderView(
      backdropURL: MockData.sampleMovie1.backdropURL,
      onDismiss: nil
    )
  }
}
