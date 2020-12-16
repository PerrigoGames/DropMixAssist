//
//  SongAttributesView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongAttributesView: View {
  @State var song: Song
  
  var body: some View {
    VStack(alignment: .trailing) {
      Text("\(song.bpm) BPM")
      if (song.keyLetter != .None && song.keyMajMin != .None) {
        HStack {
          Text(song.keyLetter.rawValue)
          Text(song.keyMajMin.rawValue)
            .foregroundColor(song.keyMajMin.color())
        }
      }
    }
    .font(.footnote)
  }
}

struct SongAttributesView_Previews: PreviewProvider {
  static var previews: some View {
    SongAttributesView(song: SampleData.song)
  }
}
