//
//  RegisterView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 08/06/2023.
//

import SwiftUI

struct RegisterView: View, FormView {

    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        MyForm {
            appNameRow()
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))

            subHeaderTextRow(title: "Create your account")
                .rowViewBackground()

            nameFieldRow(icon: Image("ic-profile"), value: $username)
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))

            emailFieldRow(icon: Image("ic-email"), value: $email)
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))

            passwordFieldRow(icon: Image("ic-lock"), value: $password)
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))

            passwordFieldRow(icon: Image("ic-lock"), value: $confirmPassword, placeholder: "Confirm Password")
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))

            buttonRow(title: "Register") {}
                .rowViewBackground()
                .listRowInsets(EdgeInsets(top: 40, leading: 15, bottom: 30, trailing: 15))

            hstackRow {
                Spacer()
                Text("-")
                    .foregroundColor(Color.DesignSystem.brandColor)
                Text("Or Register with")
                    .font(Font.DesignSystem.textSmReguler)
                    .foregroundColor(Color.DesignSystem.subHeaderColor)
                Text("-")
                    .foregroundColor(Color.DesignSystem.brandColor)
                Spacer()
            }
            .rowViewBackground()

            socialButtonRow(googleAction: {

            }, facebookAction: {

            }, twitterAction: {

            })
            .rowViewBackground()
            .listRowInsets(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
