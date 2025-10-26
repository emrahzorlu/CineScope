//
//  UIColor+Extensions.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import UIKit

import SwiftUI

extension Color {
  init(hex: String) {
    var sanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    sanitized = sanitized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt64 = 0
    Scanner(string: sanitized).scanHexInt64(&rgb)
    
    let r, g, b, a: Double
    if sanitized.count == 8 {
      r = Double((rgb & 0xFF000000) >> 24) / 255
      g = Double((rgb & 0x00FF0000) >> 16) / 255
      b = Double((rgb & 0x0000FF00) >> 8) / 255
      a = Double(rgb & 0x000000FF) / 255
    } else {
      r = Double((rgb & 0xFF0000) >> 16) / 255
      g = Double((rgb & 0x00FF00) >> 8) / 255
      b = Double(rgb & 0x0000FF) / 255
      a = 1.0
    }
    
    self.init(red: r, green: g, blue: b, opacity: a)
  }
}
