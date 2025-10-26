//
//  CustomTabBarView.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

struct CustomTabBarView: View {
  @Binding var selectedTab: TabItem
  @Namespace private var animation
  
  var body: some View {
    HStack(spacing: 0) {
      ForEach(TabItem.allCases, id: \.self) { tab in
        TabBarButton(
          tab: tab,
          selectedTab: $selectedTab,
          animation: animation
        )
      }
    }
    .padding(.horizontal, 8)
    .padding(.vertical, 8)
    .background(tabBarBackground)
    .clipShape(Capsule())
    .padding(.horizontal, 32)
    .padding(.bottom, 8)
  }
  
  private var tabBarBackground: some View {
    LinearGradient(
      colors: [
        Color(hex: "3B1578"),
        Color(hex: "5172B3")
      ],
      startPoint: .leading,
      endPoint: .trailing
    )
  }
}

struct TabBarButton: View {
  let tab: TabItem
  @Binding var selectedTab: TabItem
  let animation: Namespace.ID
  
  private var isSelected: Bool {
    selectedTab == tab
  }
  
  var body: some View {
    Button {
      withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
        selectedTab = tab
      }
    } label: {
      ZStack {
        if isSelected {
          Circle()
            .fill(.ultraThinMaterial)
            .frame(width: 48, height: 48)
            .overlay(
              Circle()
                .stroke(
                  LinearGradient(
                    colors: [
                      Color(hex: "5EEACA").opacity(0.5),
                      Color.white.opacity(0.3)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  ),
                  lineWidth: 2
                )
            )
            .shadow(color: Color(hex: "5EEACA").opacity(0.3), radius: 8, x: 0, y: 4)
            .matchedGeometryEffect(id: "TAB", in: animation)
        }
        
        Image(systemName: tab.icon)
          .font(.system(size: isSelected ? 20 : 18))
          .foregroundColor(.white)
          .scaleEffect(isSelected ? 1.1 : 1.0)
      }
      .frame(maxWidth: .infinity)
      .frame(height: 48)
    }
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    
    VStack {
      Spacer()
      CustomTabBarView(selectedTab: .constant(.home))
    }
  }
}
