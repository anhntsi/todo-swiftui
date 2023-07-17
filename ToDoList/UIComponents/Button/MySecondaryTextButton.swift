//
//  MySecondaryTextButton.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 10/06/2023.
//

import SwiftUI

struct MySecondaryTextButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.isDestructive) var isDestructive: Bool
    var size: MyButton.Size

    private var horizontalPadding: CGFloat {
        switch size {
        case .medium:
            return 29
        case .large:
            return 45
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .medium:
            return 9
        case .large:
            return 13
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

struct MySecondaryTextButton<Content>: View where Content: View {
    var size: MyButton.Size = .large
    var action: () -> Void = {}
    var childView: () -> Content

    var body: some View {
        Button(action: action) {
            HStack {
                childView()
            }
        }
        .buttonStyle(MySecondaryTextButtonStyle(size: size))
    }
}

struct MySecondaryTextButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                MySecondaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
                .environment(\.isDestructive, true)

                MySecondaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
                .disabled(true)

                MySecondaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
            }

            Group {
                MySecondaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
                .environment(\.isDestructive, true)

                MySecondaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
                .disabled(true)

                MySecondaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
            }

            Group {
                MySecondaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
                .environment(\.isDestructive, true)

                MySecondaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
                .disabled(true)

                MySecondaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
            }

            Group {
                MySecondaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
                .environment(\.isDestructive, true)

                MySecondaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
                .disabled(true)

                MySecondaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                            .renderingMode(.template)
                    }
                }
            }
        }
    }
}
