//
//  SongCardListView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongCardDetailView: View {
  @State var song: Song
  
  private func cardText(forType type: CardType) -> String {
    guard let card = song.card(forType: type) else {
      return ""
    }
    let instrumentString = card.instruments
      .map { $0.rawValue }
      .joined(separator: ", ")
    return "\(instrumentString) (\(card.level))"
  }
  
  var body: some View {
    HStack {
      let songCards = song
        .songCards()
        .sorted { lhs, rhs in
          lhs.card.type.sortValue() < rhs.card.type.sortValue()
        }
      ForEach(songCards, id: \.self) { sC in
        Text(cardText(forType: sC.card.type))
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(sC.card.type.color())
      }
      Spacer()
    }
  }
}

struct SongCardDetailView_Previews: PreviewProvider {
  static var previews: some View {
    SongCardDetailView(song: SampleData.song)
  }
}
