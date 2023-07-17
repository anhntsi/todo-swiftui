//
//  SettingsView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 02/06/2023.
//

import SwiftUI

struct SettingsView: View, FormView {

    let settings: [SettingModel] = [
        SettingModel(icon: "notifications", name: "Notification"),
        SettingModel(icon: "lock-closed", name: "Security"),
        SettingModel(icon: "help-buoy", name: "Help"),
        SettingModel(icon: "sync-circle", name: "Update System"),
        SettingModel(icon: "information-circle", name: "About"),
        SettingModel(icon: "people", name: "Invite a friend")
    ]

    var body: some View {
        ZStack {
            Color.DesignSystem.brandColor
                .ignoresSafeArea()

            VStack {
                Spacer(minLength: 39)
                MyForm {
                    ForEach(settings) { setting in
                        cell(setting)
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, -20)
                .formViewBackground(Color.white)
                .cornerRadius(50, corners: [.topLeft, .topRight])
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }

    private func cell(_ setting: SettingModel) -> some View {
        textRow(icon: Image(setting.icon), title: setting.name)
            .frame(height: 44)
            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
