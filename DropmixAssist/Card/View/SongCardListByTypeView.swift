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
    VStack(alignment: .leading) {
      ScrollView {
        LazyVStack {
          ForEach(filtered(), id: \.self) {
            SongCardView(type: .TitleFirst, song: $0.song, card: $0.card)
            Divider()
          }
        }
      }
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
          .background(Color(white: 0, opacity: 0.5))
        Slider(
          value: $typeValue,
          in: 0 ... Double(CardType.allCases.count - 1),
          step: 1
        ).padding(.leading, 2)
      }
    }
  }
}

struct SongCardListByTypeView_Previews: PreviewProvider {
  static var previews: some View {
    SongCardListByTypeView(sortedList: SampleData.song.songCards())
  }
}
