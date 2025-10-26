//
//  BackGroundView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct BackGroundView: View {
  var body: some View {
    ZStack {
      LinearGradient(
        colors: [
          Color(hex: "2E1371"),
          Color(hex: "130B2B")
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()
      
      Circle()
        .fill(Color(hex: "60FFCA").opacity(0.4))
        .frame(width: 400, height: 400)
        .blur(radius: 120)
        .offset(x: -100, y: -130)
      
      Circle()
        .fill(Color(hex: "FF53C0").opacity(0.35))
        .frame(width: 350, height: 350)
        .blur(radius: 120)
        .offset(x: 100, y: 150)
    }
  }
}

#Preview {
  BackGroundView()
}
