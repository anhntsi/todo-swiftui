import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func subHeaderTextRow(
        title: String,
        insets: EdgeInsets? = nil
    ) -> SubHeaderTextRow
    {
        SubHeaderTextRow(
            title: title,
            insets: insets
        )
    }
}

// MARK: - SubHeaderTextRow

@MainActor
public struct SubHeaderTextRow: View
{
    private let title: String
    private let insets: EdgeInsets?

    internal init(
        title: String,
        insets: EdgeInsets? = nil
    )
    {
        self.title = title
        self.insets = insets
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            Spacer()
            Text(title)
                .multilineTextAlignment(.center)
                .font(Font.DesignSystem.textSmMedium)
                .foregroundColor(Color.DesignSystem.subHeaderColor)
            Spacer()
        }
    }
}
