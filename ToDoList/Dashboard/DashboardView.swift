//
//  DashboardView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 12/07/2023.
//

import SwiftUI

struct DashboardView: View, BaseView {
    var body: some View {
        ScrollView {
            HStack {
                Text("Saturday, Feb 20 2022")
                    .font(Font.DesignSystem.textXsReguler)
                    .foregroundColor(Color.DesignSystem.subHeaderColor)
                Spacer()
                Button {

                } label: {
                    Image("notifications")
                }
            }
            .padding(.horizontal, 15)

            Spacer(minLength: 30)

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Welcome Phillip")
                        .textStyle(.largeTitle)
                    Spacer()
                }
                Text("Have a nice day !")
                    .font(Font.DesignSystem.textBaseReguler)
                    .foregroundColor(Color.DesignSystem.subHeaderColor)
            }
            .padding(.horizontal, 15)

            Spacer(minLength: 32)

            headingText(title: "My Priority Task")
                .padding(.horizontal, 15)

            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 129, height: 188)
                    }
                }
            }
            .padding(.leading, 15)

            headingText(title: "Daily Task")
                .padding(.horizontal, 15)

            LazyVStack {

            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
