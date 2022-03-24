//
//  Reader.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/23/22.
//

import Foundation

func initWordsArray() -> Array<String> {
    var wordsArray: Array<String>
    let filePath = Bundle.main.path(forResource: "words-five-len", ofType: ".json")
    let urlPath = URL(fileURLWithPath: filePath!)
    do {
        let json_data = try Data(contentsOf: urlPath)
        wordsArray = try JSONDecoder().decode(Array<String>.self, from: json_data)
    } catch {
        print("There was an error trying to read file")
        return []
    }
    return wordsArray // successful run
}
