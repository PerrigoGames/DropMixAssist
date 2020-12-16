//
//  SongListView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongListView: View {
  @State var sortedList: [Song]
  @State var type: SongViewType
  
  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(sortedList, id: \.self) { song in
          Group {
            if song.isFX() {
              SongFXView(songCard: song.songCards()[0])
            } else {
              SongView(type: type, song: song)
            }
          }
          Divider()
        }
      }
    }
  }
}

struct SongListView_Previews: PreviewProvider {
  static var previews: some View {
    SongListView(sortedList: SampleData.songList, type: .ArtistFirst)
  }
}
