//
//  ContentView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTab: TabItem = .home
  
  var body: some View {
    ZStack {
      BackGroundView()
        .ignoresSafeArea()
      
      Group {
        switch selectedTab {
        case .home:
          HomeView()
        case .search:
          SearchView()
        case .favorites:
          FavoritesView()
        case .settings:
          SettingsView()
        }
      }
      
      VStack {
        Spacer()
        CustomTabBarView(selectedTab: $selectedTab)
          .padding(.bottom, 20)
      }
      .ignoresSafeArea(edges: .bottom)
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  ContentView()
}
