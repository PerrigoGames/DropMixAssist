//
//  SongData.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/13/20.
//

import Foundation

extension Song {
  static let list : Array<Song> = {
    guard let data = FileUtil.readLocalFile(forName: "songs") else {
      return []
    }
    do {
      let list = try JSONDecoder().decode(Array<Song>.self, from: data)
      return list
    } catch {
      print("decode error")
      return []
    }
  }()
}
