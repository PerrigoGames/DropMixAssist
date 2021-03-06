//
//  SongCardListByTypeView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongCardListByTypeView: View {
  @State var sortedList: [SongCard]
  
  @State var typeToggle: Bool = false
  @State var typeValue: Double = 0
  
  func filtered() -> [SongCard] {
    sortedList.filter { !typeToggle || $0.card.type == CardType.allCases[Int(typeValue)] }
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ScrollView {
        LazyVStack {
          ForEach(filtered(), id: \.self) { songCard in
            Group {
              if songCard.song.isFX() {
                SongFXView(songCard: songCard)
              } else {
                SongCardView(type: .TitleFirst, songCard: songCard)
              }
            }
            Divider()
          }
        }
      }
      Divider()
      VStack(alignment: .leading) {
        Text("Type Filter")
          .font(.footnote)
        HStack {
          let cardType = CardType.allCases[Int(typeValue)]
          Toggle("", isOn: $typeToggle)
            .labelsHidden()
          Text(cardType.rawValue)
            .bold()
            .frame(width: 60)
            .foregroundColor(cardType.color())
          Slider(
            value: $typeValue,
            in: 0 ... Double(CardType.allCases.count - 1),
            step: 1
          ).padding(.leading, 2)
        }
      }
      .padding()
    }
  }
}

struct SongCardListByTypeView_Previews: PreviewProvider {
  static var previews: some View {
    SongCardListByTypeView(sortedList: SampleData.song.songCards())
  }
}
