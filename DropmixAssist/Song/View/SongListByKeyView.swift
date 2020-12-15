//
//  SongListByKeyView.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import SwiftUI

struct SongListByKeyView: View {
  @State var sortedList: [Song]
  @State var type: SongViewType
  
  @State var keyLetterToggle: Bool = false
  @State var keyLetterValue: Double = 0
  @State var keyMajMinToggle: Bool = false
  @State var keyMajMinValue: Double = 0
  
  private func filtered() -> [Song] {
    return sortedList.filter { song in
      (!keyLetterToggle || song.keyLetter == KeyLetter.allCases[Int(keyLetterValue)])
        && (!keyMajMinToggle || song.keyMajMin == KeyMajMin.allCases[Int(keyMajMinValue)])
    }
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ScrollView {
        LazyVStack {
          ForEach(filtered(), id: \.self) {
            SongView(type: type, song: $0)
            Divider()
          }
        }
      }
      Divider()
      VStack(alignment: .leading) {
        Text("Key Filter")
          .font(.footnote)
        HStack {
          Toggle("", isOn: $keyLetterToggle)
            .labelsHidden()
          Text(KeyLetter.allCases[Int(keyLetterValue)].rawValue)
            .frame(width: 60)
          Slider(
            value: $keyLetterValue,
            in: 0 ... Double(KeyLetter.allCases.count - 1),
            step: 1
          ).padding(.leading, 2)
        }
         
        HStack {
          Toggle("", isOn: $keyMajMinToggle)
            .labelsHidden()
          Text(KeyMajMin.allCases[Int(keyMajMinValue)].rawValue)
            .frame(width: 60)
          Slider(
            value: $keyMajMinValue,
            in: 0 ... Double(KeyMajMin.allCases.count - 1),
            step: 1
          ).padding(.leading, 2)
          .frame(width: 50)
        }
      }
      .padding()
    }
  }
}

struct SongListByKeyView_Previews: PreviewProvider {
  static var previews: some View {
    SongListByKeyView(sortedList: SampleData.songList, type: .ArtistFirst)
  }
}
