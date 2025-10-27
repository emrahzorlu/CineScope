//
//  HomeView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject private var viewModel = HomeViewModel.shared
  
  var body: some View {
    NavigationStack {
      ZStack {
        BackGroundView()
          .ignoresSafeArea()
        
        if viewModel.isLoading {
          ProgressView()
            .scaleEffect(2)
            .tint(.white)
          
        } else if let error = viewModel.errorMessage {
          VStack {
            Image(systemName: "exclamationmark.triangle")
              .font(.system(size: 50))
              .foregroundStyle(.red)
            
            Text(error)
              .multilineTextAlignment(.center)
              .foregroundStyle(.white)
            
            Button("Tekrar Dene") {
              Task {
                await viewModel.loadMovies()
              }
            }
            .buttonStyle(.borderedProminent)
          }
          .padding()
          
        } else {
          ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0, pinnedViews: []) {
              if !viewModel.trendingMovies.isEmpty {
                CarouselHeaderView(movies: viewModel.trendingMovies)
              }
              
              VStack(alignment: .leading, spacing: 24) {
                MovieSection(
                  title: "Trend Olanlar",
                  movies: viewModel.trendingMovies
                )
                
                MovieSection(
                  title: "Popüler",
                  movies: viewModel.popularMovies
                )
                
                MovieSection(
                  title: "Vizyondakiler",
                  movies: viewModel.nowPlayingMovies
                )
                
                MovieSection(
                  title: "En Yüksek Puanlılar",
                  movies: viewModel.topRatedMovies
                )
              }
              .padding(.top, 20)
              .padding(.bottom, 80)
            }
          }
          .ignoresSafeArea(edges: .top)
        }
      }
      .navigationTitle("CineScope")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
      .toolbarColorScheme(.dark, for: .navigationBar)
      .navigationDestination(for: Movie.self) { movie in
        MovieDetailView(movie: movie)
      }
      .task {
        await viewModel.loadMovies()
      }
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  HomeView()
}
