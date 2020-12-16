//
//  CardSongListView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongCardListView: View {
  @State var sortedList: [SongCard]
  
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(sortedList, id: \.self) {
          SongCardView(type: .TitleFirst, songCard: $0)
          Divider()
        }
      }
    }
  }
}

struct SongCardListView_Previews: PreviewProvider {
  static var previews: some View {
    SongCardListView(sortedList: SampleData.song.songCards())
  }
}
