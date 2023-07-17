//
//  AsyncButtonRow.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 08/06/2023.
//

import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func asyncButtonRow(
        icon: Image? = nil,
        title: String,
        insets: EdgeInsets? = nil,
        action: @escaping () async throws -> Void
    ) -> AsyncButtonRow
    {
        AsyncButtonRow(
            icon: icon,
            title: title,
            insets: insets,
            action: action
        )
    }
}

// MARK: - AsyncButtonRow

@MainActor
public struct AsyncButtonRow: View, ButtonView
{
    private let icon: Image?
    private let title: String
    private let insets: EdgeInsets?
    private let action: () async throws -> Void

    @State private var isLoading: Bool = false
    @State private var currentTask: Task<Void, Error>?

    internal init(
        icon: Image? = nil,
        title: String,
        insets: EdgeInsets? = nil,
        action: @escaping () async throws -> Void
    )
    {
        self.icon = icon
        self.title = title
        self.insets = insets
        self.action = action
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            icon.frame(minWidth: 30, maxWidth: 30)
            primaryLargeTextButton(label: title) {
                currentTask?.cancel()
                currentTask = Task {
                    isLoading = true
                    try await action()
                    isLoading = false
                }
            }

            if isLoading {
                Spacer()
                ProgressView()
                    .onTapGesture {
                        currentTask?.cancel()
                        isLoading = false
                    }
            }
        }
    }
}
