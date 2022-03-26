//
//  Reader.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/23/22.
//

import Foundation

// function that will read the array of words in words-file-len.json
func initWordsArray() -> Array<String> {
    var wordsArray: Array<String> = []
    let filePath = Bundle.main.path(forResource: "words-five-len", ofType: ".json")
    let urlPath = URL(fileURLWithPath: filePath!) // set the URL path
    do {
        let json_data = try Data(contentsOf: urlPath) // try to get data from urlPath
        wordsArray = try JSONDecoder().decode(Array<String>.self, from: json_data) // decode json_data and assign it into words array
    } catch { // if file doesn't exist or an error occurs trying to assign contents into json_data or decode json_data into string array
        print("There was an error trying to read file")
        return ["ERROR"] // this will only be shown to the user if an error occurs since generate word will always choose this
    }
    return wordsArray // successful run
}
