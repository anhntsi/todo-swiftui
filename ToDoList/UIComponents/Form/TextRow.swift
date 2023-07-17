import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func textRow(
        icon: Image? = nil,
        title: String,
        value: Any? = nil,
        insets: EdgeInsets? = nil
    ) -> TextRow<EmptyView>
    {
        TextRow(
            icon: icon,
            title: title,
            value: value,
            insets: insets,
            accessory: {}
        )
    }

    @ViewBuilder
    public func textRow<Accessory>(
        icon: Image? = nil,
        title: String,
        value: Any? = nil,
        insets: EdgeInsets? = nil,
        @ViewBuilder accessory: @escaping () -> Accessory
    ) -> TextRow<Accessory>
        where Accessory: View
    {
        TextRow(
            icon: icon,
            title: title,
            value: value,
            insets: insets,
            accessory: accessory
        )
    }
}

// MARK: - TextRow

@MainActor
public struct TextRow<Accessory>: View
    where Accessory: View
{
    private let icon: Image?
    private let title: String
    private let value: String?
    private let insets: EdgeInsets?
    private let accessory: () -> AnyView?

    internal init(
        icon: Image? = nil,
        title: String,
        value: Any?,
        insets: EdgeInsets? = nil,
        @ViewBuilder accessory: @escaping () -> Accessory
    )
    {
        self.icon = icon
        self.title = title
        self.value = value.map { "\($0)" }
        self.insets = insets
        self.accessory = { AnyView(accessory()) }
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            icon
                .frame(width: 25, height: 25)
                .padding(.leading, 47)
                .padding(.trailing, 32)
            Text(title)
                .font(Font.DesignSystem.textXsReguler)
            Spacer()
            if let value = value {
                Text(value)
            }
            if let accessory = accessory() {
                accessory
            }
        }
    }
}
