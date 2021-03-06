//
//  KeyboardButton.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct KeyboardButton: View {
    var keyCharacter: String
    @Binding var inputSlot: String
    var moveNextCol: () -> Void
    var body: some View {
        Button (action: KeyButtonPress) {
            Text(keyCharacter)
                .frame(width: 34, height: 68, alignment: .center)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.white)
        }.background(Color.gray)
            .cornerRadius(10)
        
    }
    func KeyButtonPress() {
        // if we are at the last index (we don't exceed past array.count - 1), check if the current slot is empty
        // if it's not empty, then we don't update slot, otherwise, update
        if (inputSlot == "") {
            inputSlot = keyCharacter;
        }
        moveNextCol() // columnNum never exceeds array.count - 1
    }
}

struct KeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardButton(keyCharacter: "a", inputSlot: .constant(""), moveNextCol: {})
    }
}
