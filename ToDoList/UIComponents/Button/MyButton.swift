//
//  MyButton.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 09/06/2023.
//

import SwiftUI

struct MyButton: View {
    var icon: Image?
    var label: String = ""
    var style: Style = .primary
    var size: Size = .large
    var fullWidth: Bool = false
    var renderAsTemplate: Bool = true
    var action: () -> Void = {}

    enum Style {
        case primary
        case secondary
    }

    enum Size {
        case large
        case medium
    }

    func content() -> some View {
        Group {
            HStack {
                if fullWidth { Spacer() }
                Text(label)
                if let icon = icon {
                    icon
                }
                if fullWidth { Spacer() }

            }
        }
    }

    @ViewBuilder
    var body: some View {
        VStack {
            switch style {
            case .primary:
                if let icon = icon, label.isEmpty {
                    MyPrimaryIconButton(size: size, action: action) {
                        icon
                    }
                } else {
                    MyPrimaryTextButton(size: size, action: action) {
                        content()
                    }
                }
            case .secondary:
                if let icon = icon, label.isEmpty {
                    MySecondaryIconButton(size: size, action: action) {
                        Group {
                            if renderAsTemplate {
                                icon
                                    .renderingMode(.template)
                            } else {
                                icon
                            }
                        }
                    }
                } else {
                    MySecondaryTextButton(size: size, action: action) {
                        content()
                    }
                }
            }
        }
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton()
    }
}

protocol ButtonView {}

extension ButtonView {
    func primaryLargeTextButton(label: String, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(label: label, style: .primary, size: .large, fullWidth: fullWidth, action: action)
    }

    func primaryMediumTextButton(label: String, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(label: label, style: .primary, size: .medium, fullWidth: fullWidth, action: action)
    }

    func primaryLargeTextIconButton(label: String, icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, label: label, style: .primary, size: .large, fullWidth: fullWidth, action: action)
    }

    func primaryMediumTextIconButton(label: String, icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, label: label, style: .primary, size: .medium, fullWidth: fullWidth, action: action)
    }

    func primaryLargeIconButton(icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, style: .primary, size: .large, fullWidth: fullWidth, action: action)
    }

    func primaryMediumIconButton(icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, style: .primary, size: .medium, fullWidth: fullWidth, action: action)
    }

    func secondaryLargeTextButton(label: String, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(label: label, style: .secondary, size: .large, fullWidth: fullWidth, action: action)
    }

    func secondaryMediumTextButton(label: String, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(label: label, style: .secondary, size: .medium, fullWidth: fullWidth, action: action)
    }

    func secondaryLargeTextIconButton(label: String, icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, label: label, style: .secondary, size: .large, fullWidth: fullWidth, action: action)
    }

    func secondaryMediumTextIconButton(label: String, icon: Image, fullWidth: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, label: label, style: .secondary, size: .medium, fullWidth: fullWidth, action: action)
    }

    func secondaryLargeIconButton(icon: Image, fullWidth: Bool = true, renderAsTemplate: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, style: .secondary, size: .large, fullWidth: fullWidth, renderAsTemplate: renderAsTemplate, action: action)
    }

    func secondaryMediumIconButton(icon: Image, fullWidth: Bool = true, renderAsTemplate: Bool = true, action: @escaping () -> Void) -> MyButton {
        return MyButton(icon: icon, style: .secondary, size: .medium, fullWidth: fullWidth, renderAsTemplate: renderAsTemplate, action: action)
    }
}
