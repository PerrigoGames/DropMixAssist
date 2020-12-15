//
//  SampleData.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/14/20.
//

import Foundation

class SampleData {
  static let song = Song(
    artist: "Eiffel 65",
    title: "I'm Blue (Da Ba Dee)",
    style: "Electronic",
    bpm: 150,
    key: "C Minor",
    cards: [
      Card(level: 1, instruments: [.Vocals], type: .Lead, playlist: "Test"),
      Card(level: 2, instruments: [.Sampler], type: .Loop, playlist: "Test"),
      Card(level: 2, instruments: [.Drums], type: .Beat, playlist: "Test"),
      Card(level: 3, instruments: [.Synths], type: .Bass, playlist: "Test"),
    ]
  )
  
  static let card = song.cards[0]
  
  static let songList = [song]
}
