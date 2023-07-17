import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func buttonRow(
        icon: Image? = nil,
        title: String,
        insets: EdgeInsets? = nil,
        action: @escaping () -> Void
    ) -> ButtonRow
    {
        ButtonRow(
            icon: icon,
            title: title,
            insets: insets,
            action: action
        )
    }
}

// MARK: - ButtonRow

@MainActor
public struct ButtonRow: View, ButtonView
{
    private let icon: Image?
    private let title: String
    private let insets: EdgeInsets?
    private let action: () -> Void

    internal init(
        icon: Image? = nil,
        title: String,
        insets: EdgeInsets? = nil,
        action: @escaping () -> Void
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
            primaryLargeTextButton(label: title, action: action)
        }
    }
}
