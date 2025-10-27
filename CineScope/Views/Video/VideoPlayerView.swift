//
//  VideoPlayerView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 27.10.2025.
//

import SwiftUI
import YouTubePlayerKit

struct VideoPlayerView: View {
  @Binding var video: MovieVideo?  // ← Binding olarak değiştirdik
  let movieTitle: String
  @Environment(\.dismiss) private var dismiss
  
  var youtubePlayer: YouTubePlayer? {
    // DEBUG
    print("🔍 VideoPlayerView Init:")
    print("  - video: \(video != nil ? "VAR" : "YOK")")
    if let video = video {
      print("  - video.key: \(video.key)")
      print("  - video.name: \(video.name)")
      print("  - video.site: \(video.site)")
      print("  - video.type: \(video.type)")
    }
    
    // Video varsa player oluştur
    guard let videoKey = video?.key else {
      print("  ❌ video.key NIL - Player oluşturulmadı")
      return nil
    }
    
    print("  ✅ Player oluşturuluyor - Video ID: \(videoKey)")
    return YouTubePlayer(source: .video(id: videoKey))
  }
  
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      
      VStack(spacing: 0) {
        // Close Button
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 36))
              .foregroundColor(.white.opacity(0.8))
              .shadow(radius: 8)
          }
          .padding()
          
          Spacer()
        }
        
        Spacer()
        
        // Video Player veya Hata Mesajı
        if let player = youtubePlayer, let currentVideo = video {
          // YouTube Player
          YouTubePlayerView(player)
            .frame(height: 250)
            .cornerRadius(12)
            .padding(.horizontal)
            .onAppear {
              print("✅ Player ve video VAR - UI render ediliyor")
            }
          
          Spacer()
          
          // Video Info
          VStack(alignment: .leading, spacing: 12) {
            Text(currentVideo.name)
              .font(.title3)
              .fontWeight(.bold)
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
              .frame(maxWidth: .infinity, alignment: .center)
            
            HStack(spacing: 16) {
              Label(currentVideo.type, systemImage: "film.fill")
                .font(.subheadline)
                .foregroundColor(.gray)
              
              if currentVideo.official {
                Label("Resmi", systemImage: "checkmark.seal.fill")
                  .font(.subheadline)
                  .foregroundColor(.blue)
              }
            }
            .frame(maxWidth: .infinity, alignment: .center)
          }
          .padding()
          
          Spacer()
          
        } else {
          // Fragman Yok Mesajı
          VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
              .font(.system(size: 60))
              .foregroundColor(.gray)
            
            Text("Fragman Bulunamadı")
              .font(.title2)
              .fontWeight(.bold)
              .foregroundColor(.white)
            
            Text("Bu film için şu anda fragman mevcut değil")
              .font(.subheadline)
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
              .padding(.horizontal, 40)
          }
          .onAppear {
            print("❌ Player veya video YOK - Hata mesajı gösteriliyor")
            print("  - youtubePlayer: \(youtubePlayer != nil ? "VAR" : "YOK")")
            print("  - video: \(video != nil ? "VAR" : "YOK")")
          }
          
          Spacer()
        }
      }
    }
    .preferredColorScheme(.dark)
    .task {
      print("🎬 task block çalıştı")
      // Video varsa otomatik oynat
      if let player = youtubePlayer {
        print("  ✅ Player var - play() çağrılıyor")
        do {
          try await player.play()
          print("  ✅ play() başarılı")
        } catch {
          print("  ❌ play() hatası: \(error)")
        }
      } else {
        print("  ❌ Player yok - play() çağrılmadı")
      }
    }
  }
}

#Preview {
  // Trailer var
  @Previewable @State var video: MovieVideo? = MovieVideo(
    id: "1",
    key: "QV8OwaW8YsE",
    name: "Baba The Godfather Türkçe Altyazılı Fragman",
    site: "YouTube",
    type: "Trailer",
    official: true,
    publishedAt: "2024-01-01T00:00:00.000Z"
  )
  
  VideoPlayerView(
    video: $video,
    movieTitle: "The Godfather"
  )
}

#Preview("Fragman Yok") {
  // Trailer yok
  @Previewable @State var video: MovieVideo? = nil
  
  VideoPlayerView(
    video: $video,
    movieTitle: "Test Movie"
  )
}
