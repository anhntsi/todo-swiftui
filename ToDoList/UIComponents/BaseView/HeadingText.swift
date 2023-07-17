//
//  HeadingText.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 13/07/2023.
//

import SwiftUI

// MARK: - Constructors

extension BaseView
{
    @ViewBuilder
    public func headingText(
        title: String
    ) -> HeadingText
    {
        HeadingText(title: title)
    }
}

// MARK: - HeadingText
struct HeadingText: View {

    private let title: String

    internal init(title: String) {
        self.title = title
    }

    var body: some View {
        HStack {
            Text(title)
                .textStyle(.heading)
            Spacer()
        }
    }
}

struct HeadingText_Previews: PreviewProvider {
    static var previews: some View {
        HeadingText(title: "Hello World!")
    }
}
