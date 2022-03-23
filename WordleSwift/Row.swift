//
//  Row.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/22/22.
//

import SwiftUI

struct Row: View {
    @Binding var currentText: Array<String>
    var body: some View {
        HStack() {
            CharSlot(currentChar: currentText[0])
            CharSlot(currentChar: currentText[1])
            CharSlot(currentChar: currentText[2])
            CharSlot(currentChar: currentText[3])
            CharSlot(currentChar: currentText[4])
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row(currentText: .constant(["", "", "", ""])) // default
    }
}
