//
//  MySecondaryIconButton.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 10/06/2023.
//

import SwiftUI

struct MySecondaryIconButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.isDestructive) var isDestructive: Bool
    var size: MyButton.Size

    private var horizontalPadding: CGFloat {
        switch size {
        case .medium:
            return 12
        case .large:
            return 18
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .medium:
            return 12
        case .large:
            return 18
        }
    }

    private var font: Font {
        switch size {
        case .medium:
            return Font.DesignSystem.textXsReguler
        case .large:
            return Font.DesignSystem.textSmReguler
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        let color: Color
        if isDestructive {
            color = configuration.isPressed ? Color.DesignSystem.destructiveColor.opacity(0.5) : Color.DesignSystem.destructiveColor
        } else if isEnabled {
            color = configuration.isPressed ? Color.DesignSystem.brandPressedColor : Color.DesignSystem.brandColor
        } else {
            color = Color.DesignSystem.disabledColor
        }
        return configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .font(font)
            .foregroundColor(color)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 1)
            )
            .cornerRadius(10)
    }
}

struct MySecondaryIconButton<Content>: View where Content: View {
    var size: MyButton.Size = .large
    var action: () -> Void = {}
    var childView: () -> Content

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                childView()
            }
        }
        .buttonStyle(MySecondaryIconButtonStyle(size: size))
    }
}

struct MySecondaryIconButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                MySecondaryIconButton(size: .large) {

                } childView: {
                    Image("ic-profile")
                }
                .environment(\.isDestructive, true)

                MySecondaryIconButton(size: .large) {

                } childView: {
                    Image("ic-lock")
                }
                .disabled(true)

                MySecondaryIconButton(size: .large) {

                } childView: {
                    Image("ic-email")
                }
            }

            HStack {
                MySecondaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-profile")
                }
                .environment(\.isDestructive, true)

                MySecondaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-lock")
                }
                .disabled(true)

                MySecondaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-email")
                }
            }
        }
    }
}
