//
//  MyPrimaryButton.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 09/06/2023.
//

import SwiftUI

struct MyPrimaryTextButtonStyle: ButtonStyle {
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
            return 12
        case .large:
            return 14
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
        let backgroundColor: Color
        if isDestructive {
            backgroundColor = configuration.isPressed ? Color.DesignSystem.destructiveColor.opacity(0.5) : Color.DesignSystem.destructiveColor
        } else if isEnabled {
            backgroundColor = configuration.isPressed ? Color.DesignSystem.brandPressedColor : Color.DesignSystem.brandColor
        } else {
            backgroundColor = Color.DesignSystem.disabledColor
        }
        return configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .font(font)
            .foregroundColor(Color.DesignSystem.white)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct MyPrimaryTextButton<Content>: View where Content: View {
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
        .buttonStyle(MyPrimaryTextButtonStyle(size: size))
    }
}

struct MyPrimaryTextButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                MyPrimaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
                .environment(\.isDestructive, true)

                MyPrimaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
                .disabled(true)

                MyPrimaryTextButton(size: .large) {

                } childView: {
                    Text("Label")
                }
            }

            Group {
                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
                .environment(\.isDestructive, true)

                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
                .disabled(true)

                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    Text("Label")
                }
            }

            Group {
                MyPrimaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
                .environment(\.isDestructive, true)

                MyPrimaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
                .disabled(true)

                MyPrimaryTextButton(size: .large) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
            }

            Group {
                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
                .environment(\.isDestructive, true)

                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
                .disabled(true)

                MyPrimaryTextButton(size: .medium) {

                } childView: {
                    HStack {
                        Text("Label")
                        Image("ic-profile")
                    }
                }
            }
        }
    }
}
