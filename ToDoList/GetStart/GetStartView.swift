//
//  GetStartView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 26/05/2023.
//

import SwiftUI

struct GetStartView: View, ButtonView {

    @State private var currentPage: Int = 0
    let data: [Tutorial]

    var body: some View {
        VStack {
            headerView

            Spacer()

            bodyView

            Spacer()

            footerView
        }
        .background(Color.white)
    }

    private var headerView: some View {
        HStack() {
            PageControl(numberOfPages: data.count, currentPage: $currentPage)

            Spacer()

            Button("skip", action: skipTutorial)
                .font(Font.DesignSystem.textXsMedium)
                .foregroundColor(Color.DesignSystem.brandColor)
        }
        .padding(.horizontal, 15)
    }

    private var bodyView: some View {
        TabView(selection: $currentPage) {
            ForEach(data) { item in
                let index = data.firstIndex(of: item) ?? 0
                GetStartContentView(data: item)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    private var footerView: some View {
        primaryLargeTextButton(label: "Get Started", action: startApp)
            .padding(.horizontal, 40)
    }

    // MARK: - Actions
    private func skipTutorial() {

    }

    private func startApp() {

    }
}

struct GetStartView_Previews: PreviewProvider {
    static var previews: some View {
        let data = [
            Tutorial(image: "portfolio-update", title: "Easy Time Management", content: "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first"),
            Tutorial(image: "charts", title: "Increase Work Effectiveness", content: "Time management and the determination of more important tasks will give your job statistics better and always improve"),
            Tutorial(image: "new-message", title: "Reminder Notification", content: "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set")
        ]
        GetStartView(data: data)
    }
}
