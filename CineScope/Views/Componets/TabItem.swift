//
//  TabItem.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import SwiftUI

enum TabItem: Int, CaseIterable {
  case home = 0
  case search = 1
  case favorites = 2
  case settings = 3
  
  var icon: String {
    switch self {
    case .home:
      return "house.fill"
    case .search:
      return "magnifyingglass"
    case .favorites:
      return "plus.rectangle.on.rectangle.fill"
    case .settings:
      return "gearshape.fill"
    }
  }
  
  var title: String {
    switch self {
    case .home:
      return "Ana Sayfa"
    case .search:
      return "Ara"
    case .favorites:
      return "Listem"
    case .settings:
      return "Ayarlar"
    }
  }
}
