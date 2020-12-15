//
//  CardView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongCardView: View {
  @State var type: SongViewType
  @State var song: Song
  @State var card: Card
  
  private var cardBottomText: String {
    get {
      if card.type == .Wild {
        return card.type.rawValue
      } else {
        return card.instruments[0].rawValue
      }
    }
  }
  
  var body: some View {
    HStack {
      SongTitleView(type: type, song: song)
      Spacer()
      
      ZStack {
        card.type.color()
        VStack {
          Text(String(card.level))
            .font(.system(size: 18, weight: .bold))
          Text(cardBottomText)
            .font(.system(size: 12))
        }
        .padding(4)
      }
      .frame(width: 55)
      
      SongAttributesView(song: song)
        .frame(width: 70)
    }
    .padding(.horizontal)
  }
}

struct SongCardView_Previews: PreviewProvider {
    static var previews: some View {
      SongCardView(
        type: .TitleFirst,
        song: SampleData.song,
        card: SampleData.card)
    }
}
