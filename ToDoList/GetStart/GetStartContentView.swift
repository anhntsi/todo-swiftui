//
//  GetStartContentView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 28/05/2023.
//

import SwiftUI

struct Tutorial: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let content: String
}

struct GetStartContentView: View {

    let data: Tutorial

    var body: some View {
        VStack(spacing: 24) {
            Image(data.image)
                .padding(.horizontal, 15)

            Text(data.title)
                .font(Font.DesignSystem.textBaseMedium)

            Text(data.content)
                .font(Font.DesignSystem.textSmReguler)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(.horizontal, 37)
        }
    }
}

struct GetStartContentView_Previews: PreviewProvider {
    static var previews: some View {
        let data = Tutorial(image: "portfolio-update", title: "Easy Time Management", content: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first ")
        GetStartContentView(data: data)
    }
}
