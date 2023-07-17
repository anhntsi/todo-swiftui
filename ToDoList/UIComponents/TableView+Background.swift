//
//  TableView+Background.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 03/06/2023.
//

import SwiftUI

struct FormViewBackground: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
                .background(backgroundColor)
        } else {
            content
                .background(backgroundColor)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .systemBackground
                }
        }
    }
}

extension View {
    func formViewBackground(_ color: Color = .clear) -> some View {
        modifier(FormViewBackground(backgroundColor: color))
    }
}

extension View {
    func rowViewBackground(_ color: Color = .clear) -> some View {
        self
            .listRowSeparator(.hidden)
            .listRowBackground(color)
    }
}
