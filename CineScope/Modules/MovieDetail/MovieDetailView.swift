//
//  MovieDetailView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct MovieDetailView: View {
  let movie: Movie
  @StateObject private var viewModel = MovieDetailViewModel()
  @StateObject private var favoritesManager = FavoritesManager.shared
  @Environment(\.dismiss) private var dismiss
  @State private var showVideoPlayer = false
  @State private var selectedVideo: MovieVideo?
  
  var body: some View {
    ZStack {
      BackGroundView()
        .ignoresSafeArea()
      
      if viewModel.isLoading {
        VStack(spacing: 16) {
          ProgressView()
            .scaleEffect(2)
            .tint(.white)
          
          Text("Yükleniyor...")
            .foregroundColor(.white)
        }
      } else if let error = viewModel.errorMessage {
        VStack(spacing: 16) {
          Image(systemName: "exclamationmark.triangle")
            .font(.system(size: 50))
            .foregroundColor(.red)
          
          Text(error)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
          
          Button("Tekrar Dene") {
            Task {
              await viewModel.loadDetails(for: movie.id)
            }
          }
          .buttonStyle(.borderedProminent)
        }
        .padding()
      } else {
        ScrollView(showsIndicators: false) {
          VStack(spacing: 0) {
            DetailHeroHeaderView(
              backdropURL: viewModel.movieDetail?.backdropURL ?? movie.backdropURL,
              onDismiss: nil
            )
            
            VStack(spacing: 24) {
              DetailMovieInfoView(
                movie: movie,
                movieDetail: viewModel.movieDetail,
                hasTrailer: !(viewModel.videos?.trailers.isEmpty ?? true),
                isFavorite: favoritesManager.isFavorite(movie),
                onPlayTapped: {
                  print("🎬 onPlayTapped çağrıldı")
                  print("  - viewModel.videos: \(viewModel.videos != nil ? "VAR" : "YOK")")
                  if let videos = viewModel.videos {
                    print("  - trailers count: \(videos.trailers.count)")
                    if let first = videos.trailers.first {
                      print("  - first trailer key: \(first.key)")
                    }
                  }
                  
                  selectedVideo = viewModel.videos?.trailers.first
                  
                  print("  - selectedVideo set edildi: \(selectedVideo != nil ? "VAR" : "YOK")")
                  if let selected = selectedVideo {
                    print("  - selectedVideo.key: \(selected.key)")
                  }
                  
                  showVideoPlayer = true
                  print("  - showVideoPlayer = true")
                },
                onAddToListTapped: {
                  withAnimation {
                    favoritesManager.toggleFavorite(movie)
                  }
                }
              )
              
              if let credits = viewModel.credits {
                DetailCrewView(credits: credits)
              }
              
              if let cast = viewModel.credits?.mainCast, !cast.isEmpty {
                DetailCastView(cast: cast)
              }
              
              if !viewModel.similarMovies.isEmpty {
                DetailSimilarMoviesView(movies: viewModel.similarMovies)
              }
              
              if let reviews = viewModel.reviews, !reviews.results.isEmpty {
                DetailReviewsView(reviews: reviews.results)
              }
            }
          }
          .padding(.bottom, 100)
        }
        .ignoresSafeArea(edges: .horizontal)
      }
    }
    .navigationTitle(movie.title)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.left")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.white)
        }
      }
    }
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
    .toolbarColorScheme(.dark, for: .navigationBar)
    .navigationDestination(for: Movie.self) { movie in
      MovieDetailView(movie: movie)
    }
    .fullScreenCover(isPresented: $showVideoPlayer) {
      VideoPlayerView(video: $selectedVideo, movieTitle: movie.title)  // ← Binding ile geçir
        .onAppear {
          print("📺 fullScreenCover açıldı")
          print("  - selectedVideo: \(selectedVideo != nil ? "VAR" : "YOK")")
          if let video = selectedVideo {
            print("  - video.key: \(video.key)")
          }
        }
    }
    .task {
      await viewModel.loadDetails(for: movie.id)
    }
  }
}

#Preview {
  NavigationStack {
    MovieDetailView(movie: Movie(
      id: 693134,
      title: "Dune: Part Two",
      overview: "Test",
      posterPath: "/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg",
      backdropPath: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
      voteAverage: 8.2,
      releaseDate: "2024-02-27",
      genreIds: [878, 12]
    ))
  }
}
