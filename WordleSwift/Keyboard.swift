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
        VStack(spacing: 10) {
            HStack(spacing: 4) {
                Group() {
                    KeyboardButton(keyCharacter: "Q", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "W", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "E", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "R", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "T", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "Y", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "U", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "I", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "O", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                    KeyboardButton(keyCharacter: "P", inputSlot: $currentText[currentColumn], moveNextCol: moveNext)
                }
            }
            HStack(spacing: 6) {
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
            HStack(spacing: 7) {
                // Special button
                Button(action: checkAns) {
                    Text("enter")
                        .frame(width: 48, height: 68)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .background(Color.gray)
                .cornerRadius(10)
                
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
                        .frame(width: 44, height: 68)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .background(Color.gray)
                .cornerRadius(10)
                
            }
        }
    }
    // move to the next column, not row
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
    // move to the previous column, not row
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
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(currentText: .constant(["", "", "", ""]), currentColumn: .constant(0), isComplete: .constant(false), checkAns: {})
    }
}
