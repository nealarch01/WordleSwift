//
//  Keyboard.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct Keyboard: View {
    @Binding var currentText: Array<String>
    var body: some View {
        VStack(spacing: 60) {
            HStack(spacing: 28) {
                Group() {
                    KeyboardButton(keyCharacter: "Q")
                    KeyboardButton(keyCharacter: "W")
                    KeyboardButton(keyCharacter: "E")
                    KeyboardButton(keyCharacter: "R")
                    KeyboardButton(keyCharacter: "T")
                    KeyboardButton(keyCharacter: "Y")
                    // purpose of padding is to fix uneven spacings for the last few buttons
                    KeyboardButton(keyCharacter: "U")
                        .padding(.leading, 1).padding(.trailing, 1)
                    KeyboardButton(keyCharacter: "I")
                        .padding(.leading, 1).padding(.trailing, 2)
                    KeyboardButton(keyCharacter: "O")
                        .padding(.leading, 1).padding(.trailing, 1)
                    KeyboardButton(keyCharacter: "P")
                }
            }
            HStack(spacing: 28) {
                KeyboardButton(keyCharacter: "A")
                KeyboardButton(keyCharacter: "S")
                KeyboardButton(keyCharacter: "D")
                KeyboardButton(keyCharacter: "F")
                KeyboardButton(keyCharacter: "G")
                KeyboardButton(keyCharacter: "H")
                KeyboardButton(keyCharacter: "J")
                KeyboardButton(keyCharacter: "K")
                KeyboardButton(keyCharacter: "L")
            }
            HStack(spacing: 28) {
                // Special button
                Button(action: nothing) {
                    Text("enter")
                        .background(Rectangle()
                            .fill(Color.black.opacity(0.6))
                            .frame(width: 50, height: 68)
                            .cornerRadius(10)
                        )
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.white)
                }
                KeyboardButton(keyCharacter: "Z")
                KeyboardButton(keyCharacter: "X")
                KeyboardButton(keyCharacter: "C")
                KeyboardButton(keyCharacter: "V")
                KeyboardButton(keyCharacter: "B")
                KeyboardButton(keyCharacter: "N")
                KeyboardButton(keyCharacter: "M")
                // Special button
                Button(action: nothing) {
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
    func updateRow() -> Void {
        
    }
    func nothing() {
        return;
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(currentText: .constant(["", "", "", ""]))
    }
}
