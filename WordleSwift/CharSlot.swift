//
//  CharSlot.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct CharSlot: View {
    var currentChar: String
    var body: some View {
        HStack {
            Spacer()
            Text(currentChar == "" ? " " : currentChar)
            // purpose of putting an empty space to apply max padding (when there is not text in a box, the padding of each box causes uneven spacing
                .background(Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 70, height: 70)
                    .border(Color.gray, width: 3)
                )
                .font(.system(size: 36, weight: .heavy))
            Spacer()
        }
    }
}

struct CharSlot_Previews: PreviewProvider {
    static var previews: some View {
        CharSlot(currentChar: "")
    }
}
