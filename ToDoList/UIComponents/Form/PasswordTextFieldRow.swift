import SwiftUI

// MARK: - Constructors

extension FormView {
    @ViewBuilder
    public func passwordFieldRow(
        icon: Image? = nil,
        title: String? = nil,
        value: Binding<String>,
        placeholder: String = "Password",
        insets: EdgeInsets? = nil
    ) -> PasswordTextFieldRow<some View>
    {
        PasswordTextFieldRow(
            icon: icon,
            title: title,
            value: value,
            placeholder: placeholder,
            insets: insets) { textField in
                textField
                    .font(Font.DesignSystem.textXsReguler)
                    .foregroundColor(Color.DesignSystem.darkGray)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textContentType(.password)
            }
    }
}

// MARK: - PasswordTextFieldRow

@MainActor
public struct PasswordTextFieldRow<Content: View>: View
{
    private let icon: Image?
    private let title: String?
    private let value: Binding<String>
    private let placeholder: String
    private let insets: EdgeInsets?
    private let modify: (SecureField<Text>) -> Content

    internal init(
        icon: Image? = nil,
        title: String?,
        value: Binding<String>,
        placeholder: String,
        insets: EdgeInsets? = nil,
        modify: @escaping (SecureField<Text>) -> Content
    )
    {
        self.icon = icon
        self.title = title
        self.value = value
        self.placeholder = placeholder
        self.insets = insets
        self.modify = modify
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            icon
                .frame(width: 50, height: 50)
                .background(Color.DesignSystem.brandColor)
                .cornerRadius(10, corners: [.topLeft, .bottomLeft])
            if let title = title {
                Text(title)
                Spacer(minLength: 16)
            }
            modify(SecureField(placeholder, text: value))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.DesignSystem.brandColor.opacity(0.1), lineWidth: 1)
        )
    }
}

