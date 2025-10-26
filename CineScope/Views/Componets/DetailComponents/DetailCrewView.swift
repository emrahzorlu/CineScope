//
//  DetailCrewView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct DetailCrewView: View {
  let credits: CreditsResponse
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      // Yönetmen
      if let director = credits.directors.first {
        HStack(alignment: .top, spacing: 8) {  // ← .top alignment
          Text("Yönetmen:")
            .font(.subheadline)
            .foregroundColor(.gray)
          Text(director.name)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.white)
          Spacer()  // ← Sağ tarafa Spacer
        }
      }
      
      // Senaristler
      if !credits.writers.isEmpty {
        HStack(alignment: .top, spacing: 8) {  // ← .top alignment
          Text("Senaryo:")
            .font(.subheadline)
            .foregroundColor(.gray)
          Text(credits.writers.map { $0.name }.joined(separator: ", "))
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .lineLimit(2)
          Spacer()  // ← Sağ tarafa Spacer
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)  // ← Frame sola hizalı
    .padding(.horizontal)
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    DetailCrewView(credits: MockData.sampleCredits)
  }
}
