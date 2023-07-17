//
//  HeadingStyle.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 12/07/2023.
//

import SwiftUI

struct HeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.DesignSystem.textLgBold)
            .foregroundColor(Color.DesignSystem.headerColor)
    }
}

extension ViewModifier where Self == HeadingStyle {
    static var heading: HeadingStyle { HeadingStyle() }
}
