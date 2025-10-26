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
  @Environment(\.dismiss) private var dismiss
  
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
                onPlayTapped: {
                  print("İzle: \(movie.title)")
                },
                onAddToListTapped: {
                  print("Listeye ekle: \(movie.title)")
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
    .task {
      await viewModel.loadDetails(for: movie.id)
    }
  }
}

#Preview {
  NavigationStack {
    MovieDetailView(movie: MockData.sampleMovie1)
  }
}
