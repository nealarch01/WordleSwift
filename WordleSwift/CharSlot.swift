//
//  CharSlot.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct CharSlot: View {
    var currentChar: String
    @Binding var slotColor: Color
    @State private var isAnimated: Bool = false
    var body: some View {
        HStack {
            Spacer()
            Text(currentChar == "" ? " " : currentChar)
            // purpose of putting an empty space to apply max padding (when there is not text in a box, the padding of each box causes uneven spacing
                .background(
                    Rectangle()
                        .fill(slotColor.opacity(0.1))
                        .frame(width: 70, height: 70)
                        .border(Color.gray, width: 3)
                        .scaleEffect(isAnimated ? 1.2 : 1.0)
                        .onChange(of: currentChar) {_ in
                            // conditional statement to check if currentCharacter is not empty,
                            // only show animation when typing, not when deleting
                            // note: the value of currentChar will not update until AFTER .onChange instance method completes
                            if currentChar != "" {
                                return // return to not display an animation
                            }
                            isAnimated = true
                            withAnimation(.easeOut(duration: 0.3)) {
                                isAnimated = false
                            }
                        }
                )
                .font(.system(size: 36, weight: .heavy))
                .foregroundColor(Color.white)
            Spacer()
        }
    }
}

struct CharSlot_Previews: PreviewProvider {
    static var previews: some View {
        CharSlot(currentChar: "", slotColor: .constant(Color.gray))
    }
}
