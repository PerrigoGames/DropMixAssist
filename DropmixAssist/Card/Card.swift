//
//  Card.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import Foundation
import SwiftUI

struct Card: Codable {
  let level: Int
  let instruments: [Instrument]
  let type: CardType
  let playlist: String
}

enum CardType: String, CaseIterable, Codable, Comparable {
  case Lead
  case Loop
  case Beat
  case Bass
  case Wild
  case FX
  
  func color() -> Color {
    switch self {
    case .Lead: return .yellow
    case .Loop: return .red
    case .Beat: return .blue
    case .Bass: return .green
    case .Wild: return .purple
    case .FX: return .white
    }
  }
  
  func sortValue() -> Int {
    switch self {
    case .Lead: return 0
    case .Loop: return 1
    case .Beat: return 2
    case .Bass: return 3
    case .Wild: return 4
    case .FX: return 5
    }
  }
  
  static func < (lhs: CardType, rhs: CardType) -> Bool {
    lhs.sortValue() < rhs.sortValue()
  }
}

enum Instrument: String, CaseIterable, Codable {
  case Drums
  case Synths
  case Guitar
  case Vocals
  case Sampler
  case Horns
  case Strings
  case FX
}
