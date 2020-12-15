//
//  FileUtil.swift
//  DropmixAssist
//
//  Created by Corey Perrigo on 12/13/20.
//

import Foundation

class FileUtil {
  static func readLocalFile(forName name: String) -> Data? {
    do {
      if let bundlePath = Bundle.main.path(forResource: name,
                                           ofType: "json"),
        let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
        return jsonData
      }
    } catch {
      print(error)
    }
    return nil
  }
}

