//
//  TextStyle.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 12/07/2023.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
