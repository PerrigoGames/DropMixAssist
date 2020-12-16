//
//  SongFXView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/15/20.
//

import SwiftUI

struct SongFXView: View {
  @State var songCard: SongCard
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(songCard.song.title).bold()
        Text(songCard.card.effect ?? "(No effect)")
          .font(.caption)
      }
      Spacer()
      Text(String(songCard.card.level))
        .foregroundColor(CardType.FX.color())
        .font(.system(size: 24, weight: .bold))
      SongAttributesView(song: songCard.song)
        .frame(width: 60, alignment: .trailing)
    }
    .padding(.horizontal)
  }
}

struct SongFXView_Previews: PreviewProvider {
  static var previews: some View {
    SongFXView(
      songCard: SampleData.fxSongCard
    )
  }
}
