//
//  DestructiveEnvironmentKey.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 09/06/2023.
//

import SwiftUI

private struct DestructiveKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isDestructive: Bool {
        get { self[DestructiveKey.self] }
        set { self[DestructiveKey.self] = newValue }
    }
}
