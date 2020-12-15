//
//  ContentView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/12/20.
//

import SwiftUI

struct ContentView: View {
  @State var songs: [Song]
  
  var body: some View {
    TabView {
      SongListView(
        sortedList: songs.sorted { $0.artist < $1.artist },
        type: .ArtistFirst
      ).tabItem {
        Image(systemName: "macpro.gen1")
        Text("Artist")
      }

      SongListView(
        sortedList: songs.sorted { $0.title < $1.title },
        type: .TitleFirst
      ).tabItem {
        Image(systemName: "macpro.gen2")
        Text("Title")
      }
      
      SongCardListView(
        sortedList: cardsSortedByType()
      ).tabItem {
        Image(systemName: "play")
        Text("Type")
      }
      
      SongListByKeyView(
        sortedList: songs.sorted { lhs, rhs in
          if lhs.keyMajMin == rhs.keyMajMin {
            if lhs.keyLetter == rhs.keyLetter {
              return lhs.artist < rhs.artist
            } else {
              return lhs.keyLetter < rhs.keyLetter
            }
          } else {
            return lhs.keyMajMin < rhs.keyMajMin
          }
        },
        type: .TitleFirst
      ).tabItem {
        Image(systemName: "key")
        Text("Key")
      }
    }
  }
  
  private func cardsSortedByType() -> [SongCard] {
    let songCardMap: [SongCard] = songs
      .flatMap { song in
        song.cards.map { card in
          return SongCard(song: song, card: card)
        }
      }
    return songCardMap
      .sorted { sc1, sc2 in
        if sc1.card.type.sortValue() == sc2.card.type.sortValue() {
          return sc1.song.title < sc2.song.title
        } else {
          return sc1.card.type.sortValue() < sc2.card.type.sortValue()
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(
        songs: Array(Song.list.prefix(10))
      )
    }
}
