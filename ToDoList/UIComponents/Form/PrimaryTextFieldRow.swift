import SwiftUI

// MARK: - Constructors

extension FormView {
    @ViewBuilder
    public func textFieldRow<Content: View>(
        icon: Image? = nil,
        title: String? = nil,
        value: Binding<String>,
        placeholder: String = "Input Value",
        insets: EdgeInsets? = nil,
        modify: @escaping (TextField<Text>) -> Content
    ) -> PrimaryTextFieldRow<Content>
    {
        PrimaryTextFieldRow(
            icon: icon,
            title: title,
            value: value,
            placeholder: placeholder,
            insets: insets,
            modify: modify
        )
    }

    @ViewBuilder
    public func nameFieldRow(
        icon: Image? = nil,
        title: String? = nil,
        value: Binding<String>,
        placeholder: String = "Username",
        insets: EdgeInsets? = nil
    ) -> PrimaryTextFieldRow<some View>
    {
        PrimaryTextFieldRow(
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
                    .textContentType(.username)
            }
    }

    @ViewBuilder
    public func emailFieldRow(
        icon: Image? = nil,
        title: String? = nil,
        value: Binding<String>,
        placeholder: String = "Email",
        insets: EdgeInsets? = nil
    ) -> PrimaryTextFieldRow<some View>
    {
        PrimaryTextFieldRow(
            icon: icon,
            title: title,
            value: value,
            placeholder: placeholder,
            insets: insets) { textField in
                textField
                    .font(Font.DesignSystem.textXsReguler)
                    .foregroundColor(Color.DesignSystem.darkGray)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textContentType(.emailAddress)
            }
    }
}

// MARK: - PrimaryTextFieldRow

@MainActor
public struct PrimaryTextFieldRow<Content: View>: View
{
    private let icon: Image?
    private let title: String?
    private let value: Binding<String>
    private let placeholder: String
    private let insets: EdgeInsets?
    private let modify: (TextField<Text>) -> Content

    internal init(
        icon: Image? = nil,
        title: String?,
        value: Binding<String>,
        placeholder: String,
        insets: EdgeInsets? = nil,
        modify: @escaping (TextField<Text>) -> Content
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
            modify(TextField(placeholder, text: value))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.DesignSystem.brandColor.opacity(0.1), lineWidth: 1)
        )
    }
}

