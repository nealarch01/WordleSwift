//
//  ContentView.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

var AllWords: Array<String> = initWordsArray()
var WordMap: Dictionary<String, Int> = mapAllWords(word_list: AllWords)

func generateWord() -> String {
    // read from file
    return AllWords.randomElement()!
}

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var correctWord: String = generateWord()
    @State private var currentRow: Int = 0
    @State private var currentCol: Int = 0
    // Maybe change this to an observable object? Purpose to only pass one object
    @State private var rowsColors: Array<Array<Color>> = [[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]]
    // using array of an array of strings to better represent the board
    // while array of string is perfectly fine, I want to prevent the use of appending characters into the string causing size mismatching
    @State private var rowsData: Array<Array<String>> = [["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""]]
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Button(action: resetBoard) {
                    Text("Set Dark Mode")
                }
                Spacer()
                Button(action: resetBoard) {
                    Text("Reset Board")
                }
            }.padding(.leading, 10).padding(.trailing, 10).padding(.bottom, 50)
            VStack(spacing: 38) {
                Row(currentText: $rowsData[0], rowSlotColors: $rowsColors[0]) // pass state as binding to child
                Row(currentText: $rowsData[1], rowSlotColors: $rowsColors[1])
                Row(currentText: $rowsData[2], rowSlotColors: $rowsColors[2])
                Row(currentText: $rowsData[3], rowSlotColors: $rowsColors[3])
                Row(currentText: $rowsData[4], rowSlotColors: $rowsColors[4])
            }.padding(.trailing, 5).padding(.leading, 5)
            Keyboard(currentText: $rowsData[currentRow], currentColumn: $currentCol)
            Spacer()
        }
    }
    
    func resetBoard() -> Void {
        rowsData = [["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""]]
        currentRow = 0
        currentCol = 0
        correctWord = generateWord()
    }
    
    // enter clicked
    func checkAnswer() -> Void {
        
        // 3 cases
        // 1. correct letter in positions
        // 2. correct letter in wrong position
        // 3. incorrect letter
        // loop through the word that the user has entered
        
        // first check if the word exists
        var combinedString: String = "" // initialize as empty
        for letterInput in rowsData[currentRow] {
            combinedString += letterInput
        }
        if (WordMap[combinedString] != 1) { // invalid word
            return
        }
        
        /*
        for (index, letterInput) in rowsData[currentRow].enumerated() {
            // first reject a word that doesn't exist in the dictionary or an empty character is found
            if (letterInput == "") {
                return;
            }
        }
        */
    
    }
    
    func setDarkMode() -> Void {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
