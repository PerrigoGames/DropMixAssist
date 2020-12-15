//
//  SongView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/13/20.
//

import SwiftUI

enum SongViewType {
  case ArtistFirst
  case TitleFirst
}

struct SongView: View {
  @State var type: SongViewType
  @State var song: Song
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        HStack(alignment: .top) {
          SongTitleView(type: type, song: song)
          Spacer()
          Text("Wild")
            .foregroundColor(CardType.Wild.color())
            .bold()
            .padding(.trailing)
            .opacity(song.cards.contains { $0.type == .Wild } ? 1 : 0)
        }
        SongCardDetailView(song: song)
          .padding(.top, 1)
      }
      SongAttributesView(song: song)
    }
    .padding(.horizontal)
  }
}

struct SongView_Previews: PreviewProvider {
  static var previews: some View {
    SongView(
      type: .ArtistFirst,
      song: SampleData.song
    )
  }
}
