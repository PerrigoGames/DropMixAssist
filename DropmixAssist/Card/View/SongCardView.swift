//
//  CardView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongCardView: View {
  @State var type: SongViewType
  @State var songCard: SongCard
  
  private var cardBottomText: String {
    get {
      if songCard.card.type == .Wild {
        return songCard.card.type.rawValue
      } else {
        return songCard.card.instruments[0].rawValue
      }
    }
  }
  
  var body: some View {
    HStack {
      SongTitleView(type: type, song: songCard.song)
      Spacer()
      
      ZStack {
        songCard.card.type.color()
        VStack {
          Text(String(songCard.card.level))
            .font(.system(size: 18, weight: .bold))
          Text(cardBottomText)
            .font(.system(size: 12))
        }
        .padding(4)
      }
      .frame(width: 55)
      
      SongAttributesView(song: songCard.song)
        .frame(width: 60, alignment: .trailing)
    }
    .padding(.horizontal)
  }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
      SongCardView(
        type: .TitleFirst,
        songCard: SampleData.songCard
      )
    }
}
