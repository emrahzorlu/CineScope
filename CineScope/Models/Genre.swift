//
//  Genre.swift
//  CineScope
//
//  Created by Emrah Zorlu on 26.10.2025.
//

import Foundation

struct Genre: Codable, Identifiable {
  let id: Int
  let name: String
  
  static func name(for id: Int) -> String {
    switch id {
    case 28:
      return "Aksiyon"
    case 12:
      return "Macera"
    case 16:
      return "Animasyon"
    case 35:
      return "Komedi"
    case 80:
      return "Suç"
    case 99:
      return "Belgesel"
    case 18:
      return "Drama"
    case 10751:
      return "Aile"
    case 14:
      return "Fantastik"
    case 36:
      return "Tarih"
    case 27:
      return "Korku"
    case 10402:
      return "Müzikal"
    case 9648:
      return "Gizem"
    case 10749:
      return "Romantik"
    case 878:
      return "Bilim Kurgu"
    case 10770:
      return "TV Film"
    case 53:
      return "Gerilim"
    case 10752:
      return "Savaş"
    case 37:
      return "Vahşi Batı"
    default:
      return "Bilinmeyen"
    }
  }
}
