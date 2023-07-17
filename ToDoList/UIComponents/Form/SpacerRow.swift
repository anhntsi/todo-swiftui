//
//  SpacerRow.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 06/07/2023.
//

import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func spacerRow(
        height: CGFloat,
        insets: EdgeInsets? = nil
    ) -> SpacerRow
    {
        SpacerRow(
            height: height,
            insets: insets
        )
    }
}

// MARK: - ImageRow

@MainActor
public struct SpacerRow: View
{
    private let height: CGFloat
    private let insets: EdgeInsets?

    internal init(
        height: CGFloat,
        insets: EdgeInsets? = nil
    )
    {
        self.height = height
        self.insets = insets
    }

    public var body: some View
    {
        VStackRow(insets: insets) {
            Color.clear.frame(height: height)
        }
    }
}
