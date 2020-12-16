//
//  Song.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/13/20.
//

import Foundation
import SwiftUI

struct Song: Codable, Hashable {
  let artist: String
  let title: String
  let style: String?
  let bpm: Int
  let key: String?
  let cards: [Card]
  
  var keyLetter: KeyLetter {
    get {
      guard let letter = self.key?.split(separator: " ")[0] else {
        return .None
      }
      return KeyLetter.allCases.first { $0.rawValue == letter }!
    }
  }
  
  var keyMajMin: KeyMajMin {
    get {
      guard let letter = self.key?.split(separator: " ")[1] else {
        return .None
      }
      return KeyMajMin.allCases.first { $0.rawValue == letter }!
    }
  }
  
  func isFX() -> Bool {
    return self.card(forType: .FX) != nil
  }
  
  func card(forType: CardType) -> Card? {
    cards.first { $0.type == forType }
  }
  
  static func == (lhs: Song, rhs: Song) -> Bool {
    return lhs.artist == rhs.artist && lhs.title == rhs.title
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(artist)
    hasher.combine(title)
  }
}

enum KeyLetter: String, CaseIterable, Codable, Comparable {
  case None
  case Ab
  case A
  case Bb
  case B
  case C
  case Db
  case D
  case Eb
  case E
  case F
  case Gb
  case G
  
  func sortValue() -> Int {
    KeyLetter.allCases.firstIndex(of: self)!
  }
  
  static func < (lhs: KeyLetter, rhs: KeyLetter) -> Bool {
    lhs.sortValue() < rhs.sortValue()
  }
}

enum KeyMajMin: String, CaseIterable, Codable, Comparable {
  case None
  case Major
  case Minor;
  
  func sortValue() -> Int {
    KeyMajMin.allCases.firstIndex(of: self)!
  }
  
  static func < (lhs: KeyMajMin, rhs: KeyMajMin) -> Bool {
    lhs.sortValue() < rhs.sortValue()
  }
  
  func color() -> Color {
    switch self {
    case KeyMajMin.Major:
      return .green
    case KeyMajMin.Minor:
      return .red
    case KeyMajMin.None:
      return Color(white: 1, opacity: 0)
    }
  }
}
