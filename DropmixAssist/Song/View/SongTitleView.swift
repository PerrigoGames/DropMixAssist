//
//  SongTitleView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongTitleView: View {
  @State var type: SongViewType
  @State var song: Song
  
  private var topText: String {
    get {
      switch self.type {
      case .ArtistFirst:
        return song.artist
      case .TitleFirst:
        return song.title
      }
    }
  }
  
  private var bottomText: String {
    get {
      switch self.type {
      case .ArtistFirst:
        return song.title
      case .TitleFirst:
        return song.artist
      }
    }
  }
   
  var body: some View {
    VStack(alignment: .leading) {
      Text(self.topText).bold()
      Text(self.bottomText).font(.footnote)
    }
  }
}

struct SongTitleView_Previews: PreviewProvider {
  static var previews: some View {
    SongTitleView(
      type: .ArtistFirst,
      song: SampleData.song
    )
  }
}
