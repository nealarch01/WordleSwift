//
//  ContentView.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

var AllWords: Array<String> = InitWordsArray()

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var word: String = generateWord()
    @State private var wordDict: [String: Int] = [:] // initialize as empty
    @State private var currentRow: Int = 0
    @State private var currentCol: Int = 0
    // using array of an array of strings to better represent the board
    // while array of string is perfectly fine, I want to prevent the use of appending characters into the string causing size mismatching
    @State private var rowsData: Array<Array<String>> = [["A", "", "", "", ""],
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
                Row(currentText: $rowsData[0]) // pass state as binding to child
                Row(currentText: $rowsData[1])
                Row(currentText: $rowsData[2])
                Row(currentText: $rowsData[3])
                Row(currentText: $rowsData[4])
            }.padding(.trailing, 5).padding(.leading, 5)
            Keyboard(currentText: $rowsData[currentRow])
            Spacer()
        }
    }
    
    func resetBoard() -> Void {
        rowsData = [["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""]]
    }
    
    // enter clicked
    func checkAnswer() -> Void {
        // map should be the index character as a string with the associated index
        
        // 3 cases
        // 1. correct letter in positions
        // 2. correct letter in wrong position
        // 3. incorrect letter
        
        for (index, letterInput) in rowsData[currentRow].enumerated() {
            
            let wordChar = String(Array(word)[index])
            if letterInput == wordChar {
                // correct position
            }
        }
    }
    
    func setDarkMode() -> Void {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func generateWord() -> String {
    // read from file
    return AllWords.randomElement()!
}
