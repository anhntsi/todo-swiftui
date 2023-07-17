import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func imageRow(
        name: String,
        insets: EdgeInsets? = nil
    ) -> ImageRow
    {
        ImageRow(
            name: name,
            insets: insets
        )
    }
}

// MARK: - ImageRow

@MainActor
public struct ImageRow: View
{
    private let name: String
    private let insets: EdgeInsets?

    internal init(
        name: String,
        insets: EdgeInsets? = nil
    )
    {
        self.name = name
        self.insets = insets
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            Spacer()
            Image(name)
            Spacer()
        }
    }
}
