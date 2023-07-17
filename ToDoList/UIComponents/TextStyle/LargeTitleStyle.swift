//
//  LargeTitleStyle.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 12/07/2023.
//

import SwiftUI

struct LargeTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.DesignSystem.textXlBold)
            .foregroundColor(Color.DesignSystem.black)
    }
}

extension ViewModifier where Self == LargeTitleStyle {
    static var largeTitle: LargeTitleStyle { LargeTitleStyle() }
}
