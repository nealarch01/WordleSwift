//
//  KeyboardButton.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct KeyboardButton: View {
    var keyCharacter: String
    
    var body: some View {
        Button (action: KeyButtonPress) {
            Text(keyCharacter)
                .background(Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(width: 33, height: 68)
                    .cornerRadius(10)
                )
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.white)
        }
    }
    func KeyButtonPress() {
        
    }
}

struct KeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardButton(keyCharacter: "")
    }
}
