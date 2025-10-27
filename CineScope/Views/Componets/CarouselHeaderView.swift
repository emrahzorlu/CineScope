//
//  CarouselHeaderView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct CarouselHeaderView: View {
  let movies: [Movie]
  @State private var currentIndex = 0
  @State private var timer: Timer?
  
  var body: some View {
    VStack(spacing: 0) {
      TabView(selection: $currentIndex) {
        ForEach(Array(movies.prefix(5).enumerated()), id: \.element.id) { index, movie in
          NavigationLink(value: movie) { 
            FeaturedMovieHeader(movie: movie)
          }
          .buttonStyle(.plain)
          .tag(index)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      .frame(height: 500)
      
      HStack(spacing: 8) {
        ForEach(0..<min(movies.count, 5), id: \.self) { index in
          Circle()
            .fill(currentIndex == index ? Color.white : Color.white.opacity(0.4))
            .frame(width: 8, height: 8)
            .scaleEffect(currentIndex == index ? 1.2 : 1.0)
            .animation(.spring(response: 0.3), value: currentIndex)
        }
      }
      .padding(.top, 16)
      .padding(.bottom, 12)
    }
    .onAppear {
      startAutoScroll()
    }
    .onDisappear {
      stopAutoScroll()
    }
  }
  
  private func startAutoScroll() {
    timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
      withAnimation(.easeInOut(duration: 0.5)) {
        currentIndex = (currentIndex + 1) % min(movies.count, 5)
      }
    }
  }
  
  private func stopAutoScroll() {
    timer?.invalidate()
    timer = nil
  }
}

#Preview {
  NavigationStack {
    ZStack {
      Color.black.ignoresSafeArea()
      CarouselHeaderView(movies: MockData.trendingMovies)
    }
  }
}
