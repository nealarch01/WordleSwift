//
//  Row.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct Row: View {
    @Binding var currentText: Array<String>
    @Binding var rowSlotColors: Array<Color>
    var body: some View {
        HStack() {
            CharSlot(currentChar: currentText[0], slotColor: $rowSlotColors[0])
            CharSlot(currentChar: currentText[1], slotColor: $rowSlotColors[1])
            CharSlot(currentChar: currentText[2], slotColor: $rowSlotColors[2])
            CharSlot(currentChar: currentText[3], slotColor: $rowSlotColors[3])
            CharSlot(currentChar: currentText[4], slotColor: $rowSlotColors[4])
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(currentText: .constant(["", "", "", ""]), rowSlotColors: .constant([Color.gray, Color.gray, Color.gray, Color.gray])) // default
    }
}
