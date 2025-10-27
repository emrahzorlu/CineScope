//
//  SettingsView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct SettingsView: View {
  @StateObject private var favoritesManager = FavoritesManager.shared
  @State private var showClearAlert = false
  @State private var notificationsEnabled = true
  @State private var autoPlayTrailers = false
  @State private var downloadQuality = "Yüksek"
  
  var body: some View {
    NavigationStack {
      ZStack {
        BackGroundView()
          .ignoresSafeArea()
        
        List {
          // App Info Section
          Section {
            HStack(spacing: 16) {
              Image(systemName: "film.stack.fill")
                .font(.system(size: 50))
                .foregroundColor(Color(hex: "5EEACA"))
              
              VStack(alignment: .leading, spacing: 4) {
                Text("CineScope")
                  .font(.title2)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
                
                Text("Versiyon 1.0.0")
                  .font(.caption)
                  .foregroundColor(.gray)
              }
            }
            .padding(.vertical, 8)
            .listRowBackground(Color.clear)
          }
          
          // Account Section
          Section {
            HStack {
              Image(systemName: "person.crop.circle.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Hesap Bilgileri")
                .foregroundColor(.white)
              Spacer()
              Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            HStack {
              Image(systemName: "key.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Şifre Değiştir")
                .foregroundColor(.white)
              Spacer()
              Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
          } header: {
            Text("Hesap")
              .foregroundColor(.white)
          }
          
          // Preferences Section
          Section {
            Toggle(isOn: $notificationsEnabled) {
              HStack {
                Image(systemName: "bell.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("Bildirimler")
                  .foregroundColor(.white)
              }
            }
            .tint(Color(hex: "5EEACA"))
            .listRowBackground(Color.white.opacity(0.05))
            
            Toggle(isOn: $autoPlayTrailers) {
              HStack {
                Image(systemName: "play.circle.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("Fragmanları Otomatik Oynat")
                  .foregroundColor(.white)
              }
            }
            .tint(Color(hex: "5EEACA"))
            .listRowBackground(Color.white.opacity(0.05))
            
            HStack {
              Image(systemName: "arrow.down.circle.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("İndirme Kalitesi")
                .foregroundColor(.white)
              Spacer()
              Text(downloadQuality)
                .foregroundColor(.gray)
              Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
          } header: {
            Text("Tercihler")
              .foregroundColor(.white)
          }
          
          // My List Section
          Section {
            HStack {
              Image(systemName: "rectangle.stack.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Listemdeki Filmler")
                .foregroundColor(.white)
              Spacer()
              Text("\(favoritesManager.favorites.count)")
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            Button {
              showClearAlert = true
            } label: {
              HStack {
                Image(systemName: "trash.fill")
                  .foregroundColor(.red)
                Text("Listemi Temizle")
                  .foregroundColor(.red)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
            .disabled(favoritesManager.favorites.isEmpty)
          } header: {
            Text("Listem")
              .foregroundColor(.white)
          }
          
          // Storage Section
          Section {
            HStack {
              Image(systemName: "externaldrive.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Önbellek Boyutu")
                .foregroundColor(.white)
              Spacer()
              Text("124 MB")
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            Button {
              // Clear cache action
            } label: {
              HStack {
                Image(systemName: "trash.circle.fill")
                  .foregroundColor(.orange)
                Text("Önbelleği Temizle")
                  .foregroundColor(.orange)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
          } header: {
            Text("Depolama")
              .foregroundColor(.white)
          }
          
          // Support Section
          Section {
            Link(destination: URL(string: "mailto:support@cinescope.app")!) {
              HStack {
                Image(systemName: "envelope.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("Bize Ulaşın")
                  .foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.up.right")
                  .font(.caption)
                  .foregroundColor(.gray)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            Link(destination: URL(string: "https://www.cinescope.app/privacy")!) {
              HStack {
                Image(systemName: "hand.raised.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("Gizlilik Politikası")
                  .foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.up.right")
                  .font(.caption)
                  .foregroundColor(.gray)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            Link(destination: URL(string: "https://www.cinescope.app/terms")!) {
              HStack {
                Image(systemName: "doc.text.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("Kullanım Koşulları")
                  .foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.up.right")
                  .font(.caption)
                  .foregroundColor(.gray)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            Link(destination: URL(string: "https://www.themoviedb.org")!) {
              HStack {
                Image(systemName: "info.circle.fill")
                  .foregroundColor(Color(hex: "5EEACA"))
                Text("TMDB Hakkında")
                  .foregroundColor(.white)
                Spacer()
                Image(systemName: "arrow.up.right")
                  .font(.caption)
                  .foregroundColor(.gray)
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
          } header: {
            Text("Destek & Bilgi")
              .foregroundColor(.white)
          }
          
          // About Section
          Section {
            HStack {
              Image(systemName: "hammer.fill")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Geliştirici")
                .foregroundColor(.white)
              Spacer()
              Text("Emrah Zorlu")
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
            
            HStack {
              Image(systemName: "sparkles")
                .foregroundColor(Color(hex: "5EEACA"))
              Text("Yapım Yılı")
                .foregroundColor(.white)
              Spacer()
              Text("2025")
                .foregroundColor(.gray)
            }
            .listRowBackground(Color.white.opacity(0.05))
          } header: {
            Text("Hakkında")
              .foregroundColor(.white)
          }
          
          // Logout Section
          Section {
            Button {
              // Logout action
            } label: {
              HStack {
                Spacer()
                Text("Çıkış Yap")
                  .fontWeight(.semibold)
                  .foregroundColor(.red)
                Spacer()
              }
            }
            .listRowBackground(Color.white.opacity(0.05))
          }
        }
        .scrollContentBackground(.hidden)
      }
      .navigationTitle("Ayarlar")
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
      .toolbarColorScheme(.dark, for: .navigationBar)
      .alert("Listemi Temizle", isPresented: $showClearAlert) {
        Button("İptal", role: .cancel) {}
        Button("Temizle", role: .destructive) {
          withAnimation {
            favoritesManager.favorites.forEach { movie in
              favoritesManager.removeFavorite(movie)
            }
          }
        }
      } message: {
        Text("Tüm filmler listenizden silinecek. Emin misiniz?")
      }
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  SettingsView()
}
