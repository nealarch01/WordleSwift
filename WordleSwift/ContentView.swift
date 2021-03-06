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
    // choose a random word from the array
    return AllWords.randomElement()!.uppercased() // return the word in uppercase formatting
}

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var correctWord: String = /* generateWord() */ "TOWER"
    @State private var currentRow: Int = 0
    @State private var currentCol: Int = 0
    // Maybe change this to an observable object? Purpose to only pass one object
    @State private var rowsColors: Array<Array<Color>> = [[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                                                          [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]]
    // using matrix of strings to better represent the board
    // not using array of strings because I don't want to deal with appending characters
    @State private var rowsData: Array<Array<String>> = [["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""],
                                                         ["", "", "", "", ""]]
    @State private var infoText: String = ""
    @State private var isGameComplete: Bool = false
    private let rowCount: Int = 5
    private let columnCount: Int = 5
    
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                HStack {
                    Button(action: setDarkMode) {
                        Text("Set Dark Mode")
                    }
                    Spacer()
                    Button(action: resetBoard) {
                        Text("New Game")
                    }
                }.padding(.leading, 10).padding(.trailing, 10).padding(.top, 40)
                Text(infoText)
                    .foregroundColor(isDarkMode ? Color.white : Color.black)
                    .padding(.top, 10)
            }
            VStack(spacing: 38) {
                Row(currentText: $rowsData[0], rowSlotColors: $rowsColors[0], isDarkMode: $isDarkMode) // pass state as binding to child
                Row(currentText: $rowsData[1], rowSlotColors: $rowsColors[1], isDarkMode: $isDarkMode)
                Row(currentText: $rowsData[2], rowSlotColors: $rowsColors[2], isDarkMode: $isDarkMode)
                Row(currentText: $rowsData[3], rowSlotColors: $rowsColors[3], isDarkMode: $isDarkMode)
                Row(currentText: $rowsData[4], rowSlotColors: $rowsColors[4], isDarkMode: $isDarkMode)
            }.padding(.trailing, 5).padding(.leading, 5)
            Keyboard(currentText: $rowsData[currentRow],
                     currentColumn: $currentCol,
                     isComplete: $isGameComplete,
                     checkAns: checkAnswer)
            Spacer()
        }.background((isDarkMode) ? Color.black : Color.white)
    }
    
    // when reset button is pressed - board will reset and so will state of current row and column
    // also a new word will be generated
    func resetBoard() -> Void {
        isGameComplete = false
        rowsData = [["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""],
                   ["", "", "", "", ""]]
        rowsColors = [[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                      [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                      [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                      [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],
                      [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]]
        currentRow = 0
        currentCol = 0
        correctWord = generateWord()
        infoText = "" // reset info text back to default
        print("The new word is: \(correctWord)")
    }
    
    // enter clicked
    func checkAnswer() -> Void {
        if isGameComplete == true {
            return
        }
        infoText = "" // set back to empty at the start of every search
        // 3 cases
        // 1. correct letter in positions
        // 2. correct letter in wrong position
        // 3. incorrect letter
        // loop through the word that the user has entered
        
        // first check if the word exists in the list
        var combinedString: String = "" // initialize as empty // this variable holds the user input string
        
        // for loop to combine all characters (of string type) into one string
        for letterInput in rowsData[currentRow] {
            combinedString += letterInput
        }
        if (WordMap[combinedString] != 1) { // invalid word
            infoText = "The word you entered is not part of the word list"
            return
        }
        
        var wordMap: Dictionary<String, Array<Int>> = [:] // initialize word map as empty
        // initialize the word map with the current word
        for (index, letter) in correctWord.enumerated() {
            if wordMap[String(letter)] == nil {
                wordMap[String(letter)] = []
            }
            wordMap[String(letter)]!.append(index)
        }
        
        // Algorithm
        // Iterate through user's string
        //  - Get the wordmap (dictionary) value of the letter (an array of indices of the correct word's letters)
        //  - Check if the current index exists in the indices array
        //  - If the current iteration index exists as well as the character, then set the box to green and increment correct count
        //  - If the current iteration index does not exist but the character exists in the word map, then set box to yellow
        //  - If correct count == 5 at the end of the loop, then the right word has been found
        var correctCount: Int = 0
        for (currentIndex, letter) in combinedString.enumerated() {
            let mapValue = wordMap[String(letter)] ?? nil
            if mapValue == nil {
                continue;
            } else { // not equal to nil
                if mapValue!.contains(currentIndex) == true {
                    correctCount += 1
                    rowsColors[currentRow][currentIndex] = Color.green
                } else {
                    rowsColors[currentRow][currentIndex] = Color.yellow
                }
            }
        } // end of for loop iteration
        
        
        if correctCount >= 5 { // the user found the word
            infoText = "You guessed the word!"
            isGameComplete = true
        } else { // check if the user reaches at the end of the board since user didn't get the question right
            if currentRow + 1 < rowCount { // check if array is going out of bounds
                currentRow += 1
                currentCol = 0
            } else {
                // set to last index of row and column for bounds safety
                currentRow = rowCount - 1
                currentCol = columnCount - 1
                isGameComplete = true
                infoText = "You ran out of tries. The word is \(correctWord)"
            }
        }
    }
    
    // function to be implemented soon to change the display to dark mode
    func setDarkMode() -> Void {
        isDarkMode = !isDarkMode // set to the opposite of each other every click
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
