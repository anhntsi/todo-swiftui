import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func appNameRow(insets: EdgeInsets? = nil) -> AppNameRow
    {
        AppNameRow(insets: insets)
    }
}

// MARK: - AppNameRow

@MainActor
public struct AppNameRow: View
{
    private let insets: EdgeInsets?

    internal init(
        insets: EdgeInsets? = nil
    )
    {
        self.insets = insets
    }

    public var body: some View
    {
        VStackRow(insets: insets) {
            HStack {
                Spacer()
                Image("app-name")
                Spacer()
            }

            HStack {
                Spacer()
                Text("Management App")
                    .font(Font.DesignSystem.textBaseMedium)
                    .foregroundColor(Color.DesignSystem.darkGray)
                Spacer()
            }
        }
    }
}
