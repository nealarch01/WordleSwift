//
//  Keyboard.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var currentText: Array<String>
    @Binding var currentColumn: Int // index of the array we are modifying
    @Binding var isComplete: Bool
    var checkAns: () -> Void
    var body: some View {
        VStack(spacing: 60) {
            HStack(spacing: 28) {
                Group() {
                    KeyboardButton(keyCharacter: "Q", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "W", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "E", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "R", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "T", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "Y", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    // purpose of padding is to fix uneven spacings for the last few buttons
                    KeyboardButton(keyCharacter: "U", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                        .padding(.leading, 1).padding(.trailing, 1)
                    KeyboardButton(keyCharacter: "I", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                        .padding(.leading, 1).padding(.trailing, 2)
                    KeyboardButton(keyCharacter: "O", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                        .padding(.leading, 1).padding(.trailing, 1)
                    KeyboardButton(keyCharacter: "P", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                }
            }
            HStack(spacing: 28) {
                KeyboardButton(keyCharacter: "A", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "S", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "D", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "F", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "G", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "H", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "J", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "K", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "L", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
            }
            HStack(spacing: 28) {
                // Special button
                Button(action: checkAns) {
                    Text("enter")
                        .background(Rectangle()
                            .fill(Color.black.opacity(0.6))
                            .frame(width: 50, height: 68)
                            .cornerRadius(10)
                        )
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
                KeyboardButton(keyCharacter: "Z", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "X", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "C", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "V", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "B", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "N", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                KeyboardButton(keyCharacter: "M", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                // Special button
                Button(action: moveBack) {
                    Text("del")
                        .background(Rectangle()
                            .fill(Color.black.opacity(0.6))
                            .frame(width: 45, height: 68)
                            .cornerRadius(10)
                        )
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
            }
        }
    }
    
    func moveNext() -> Void {
//        print(currentText)
        if isComplete == true {
            return
        }
        if currentColumn + 1 >= currentText.count {
            currentColumn = currentText.count - 1 // never exceed count
            return; // end early to avoid incrementation
        }
        currentColumn += 1
    }
    
    // for back space key
    func moveBack() -> Void {
        if isComplete == true {
            return
        }
        if currentColumn - 1 < 0 {
            currentColumn = 0
            currentText[currentColumn] = ""
            return;
        } else if currentColumn == currentText.count - 1 && currentText[currentColumn] != "" {
            // special case since currentColumn never exceeds count - 1
            // no need to decrement in this case
            currentText[currentColumn] = ""
        } else {
            currentColumn -= 1;
            currentText[currentColumn] = "" // set back to empty
        }
//        print(currentText)
    }
    
    
    func nothing() { // will eventually remove this function later
        return;
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(currentText: .constant(["", "", "", ""]), currentColumn: .constant(0), isComplete: .constant(false), checkAns: {} )
    }
}
