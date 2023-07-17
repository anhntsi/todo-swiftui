//
//  LoginView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 28/05/2023.
//

import SwiftUI

struct LoginView: View, FormView {

    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        MyForm {
            Group {
                appNameRow(insets: EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                spacerRow(height: 60)

                subHeaderTextRow(title: "Login to your account", insets: EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))

                spacerRow(height: 20)

                emailFieldRow(icon: Image("ic-email"),value: $email, insets: EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))

                spacerRow(height: 20)

                vstackRow(insets: EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)) {
                    passwordFieldRow(icon: Image("ic-lock"), value: $password)
                    hstackRow {
                        Spacer()
                        Button("Forgot password?") {

                        }
                        .buttonStyle(.plain)
                        .font(Font.DesignSystem.textXsReguler)
                        .foregroundColor(Color.DesignSystem.brandColor)
                        .padding(.top, -8)
                    }
                }

                spacerRow(height: 25)

                buttonRow(title: "Login", insets: EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)) {}

                spacerRow(height: 35)
            }

            Group {
                hstackRow {
                    Spacer()
                    Text("-")
                        .foregroundColor(Color.DesignSystem.brandColor)
                    Text("Or Login with")
                        .font(Font.DesignSystem.textSmReguler)
                        .foregroundColor(Color.DesignSystem.subHeaderColor)
                    Text("-")
                        .foregroundColor(Color.DesignSystem.brandColor)
                    Spacer()
                }

                spacerRow(height: 20)

                socialButtonRow(
                    googleAction: {},
                    facebookAction: {},
                    twitterAction: {}
                )

                spacerRow(height: 10)

                hstackRow(insets: EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)) {
                    Spacer()
                    Text("Don’t have an account?")
                        .font(Font.DesignSystem.textXsReguler)
                        .foregroundColor(Color.DesignSystem.subHeaderColor)
                    Button("Sign Up") {}
                        .buttonStyle(.plain)
                        .font(Font.DesignSystem.textXsReguler)
                        .foregroundColor(Color.DesignSystem.brandColor)
                        .padding(.leading, -5)
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
