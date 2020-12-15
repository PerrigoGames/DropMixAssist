//
//  SongCard.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import Foundation

struct SongCard: Hashable {
  let song: Song
  let card: Card
  
  static func == (lhs: SongCard, rhs: SongCard) -> Bool {
    lhs.song == rhs.song && lhs.card.type == rhs.card.type
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(song.hashValue)
    hasher.combine(card.type)
  }
}

extension Song {
  func songCards() -> [SongCard] {
    cards.map { SongCard(song: self, card: $0) }
  }
}
