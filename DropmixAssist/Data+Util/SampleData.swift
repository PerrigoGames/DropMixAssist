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
      Card(level: 1, instruments: [.Vocals], type: .Lead, playlist: "Test", effect: nil),
      Card(level: 2, instruments: [.Sampler], type: .Loop, playlist: "Test", effect: nil),
      Card(level: 2, instruments: [.Drums], type: .Beat, playlist: "Test", effect: nil),
      Card(level: 3, instruments: [.Synths], type: .Bass, playlist: "Test", effect: nil),
    ]
  )
  static let card = song.cards[0]
  static let songCard = SongCard(song: song, card: card)
  
  static let fxSong = Song(
    artist: "FX",
    title: "Phat Beatz",
    style: "Electronic",
    bpm: 150,
    key: "C Minor",
    cards: [
      Card(level: 2, instruments: [.FX], type: .FX, playlist: "Test", effect: "This is a test effect"),
    ]
  )
  static let fxCard = fxSong.cards[0]
  static let fxSongCard = SongCard(song: fxSong, card: fxCard)
  
  static let songList = [song, fxSong]
}
