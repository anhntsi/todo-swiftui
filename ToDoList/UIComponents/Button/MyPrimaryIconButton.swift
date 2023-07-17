//
//  MyPrimaryIconButton.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 09/06/2023.
//

import SwiftUI

struct MyPrimaryIconButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @Environment(\.isDestructive) var isDestructive: Bool
    var size: MyButton.Size

    private var horizontalPadding: CGFloat {
        switch size {
        case .medium:
            return 14
        case .large:
            return 18
        }
    }

    private var verticalPadding: CGFloat {
        switch size {
        case .medium:
            return 14
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

struct MyPrimaryIconButton<Content>: View where Content: View {
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
        .buttonStyle(MyPrimaryIconButtonStyle(size: size))
    }
}

struct MyPrimaryIconButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                MyPrimaryIconButton(size: .large) {
                    
                } childView: {
                    Image("ic-profile")
                }
                .environment(\.isDestructive, true)
                
                MyPrimaryIconButton(size: .large) {
                    
                } childView: {
                    Image("ic-lock")
                }
                .disabled(true)
                
                MyPrimaryIconButton(size: .large) {
                    
                } childView: {
                    Image("ic-email")
                }
            }

            HStack {
                MyPrimaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-profile")
                }
                .environment(\.isDestructive, true)

                MyPrimaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-lock")
                }
                .disabled(true)

                MyPrimaryIconButton(size: .medium) {

                } childView: {
                    Image("ic-email")
                }
            }
        }
    }
}
