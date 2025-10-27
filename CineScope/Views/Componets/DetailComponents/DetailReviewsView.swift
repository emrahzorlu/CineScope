//
//  DetailReviewsView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct DetailReviewsView: View {
  let reviews: [Review]
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Yorumlar")
        .font(.headline)
        .foregroundColor(.white)
        .padding(.horizontal)
      
      if reviews.isEmpty {
        Text("Henüz yorum yapılmamış.")
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.horizontal)
      } else {
        VStack(spacing: 16) {
          ForEach(reviews.prefix(3)) { review in
            ReviewCardView(review: review)
          }
        }
      }
    }
  }
}

struct ReviewCardView: View {
  let review: Review
  @State private var isExpanded = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 12) {
        Circle()
          .fill(Color.gray.opacity(0.3))
          .frame(width: 40, height: 40)
          .overlay(
            Image(systemName: "person.fill")
              .foregroundColor(.gray)
          )
        
        VStack(alignment: .leading, spacing: 4) {
          Text(review.author)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
          
          if let rating = review.authorDetails.ratingText {
            HStack(spacing: 4) {
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.caption2)
              Text(rating)
                .font(.caption)
                .foregroundColor(.gray)
            }
          }
        }
        
        Spacer()
        
        Text(review.formattedDate)
          .font(.caption)
          .foregroundColor(.gray)
      }
      
      Text(isExpanded ? review.content : review.excerpt)
        .font(.subheadline)
        .foregroundColor(.gray)
        .lineSpacing(4)
      
      if review.content.count > 200 {
        Button {
          withAnimation {
            isExpanded.toggle()
          }
        } label: {
          Text(isExpanded ? "Daha az göster" : "Daha fazla göster")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundColor(.white)
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.05))
    )
    .padding(.horizontal)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    ScrollView {
      DetailReviewsView(reviews: MockData.sampleReviews.results)
    }
  }
}
