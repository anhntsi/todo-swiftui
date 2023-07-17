//
//  VerificationCodeView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 08/06/2023.
//

import SwiftUI

struct VerificationCodeView: View, FormView {
    @State private var otpCode: String = ""
    var body: some View {
        MyForm {
            Group {
                appNameRow()
                    .rowViewBackground()

                Spacer(minLength: 30)

                subHeaderTextRow(title: "Verify Account")
                    .rowViewBackground()

                Spacer(minLength: 25)

                imageRow(name: "verify-messages")
                    .rowViewBackground()

                Spacer(minLength: 25)

                subHeaderTextRow(title: "Please enter the verification number\nwe send to your email")
                    .rowViewBackground()

                Spacer(minLength: 75)
            }

            Group {
                vstackRow {
                    VStack(alignment: .leading, spacing: 0) {
                        OTPView(otpCode: $otpCode)
                        HStack {
                            Text("Don’t receive a code?")
                                .font(Font.DesignSystem.textXsReguler)
                                .foregroundColor(Color.DesignSystem.darkGray)
                            Button("Resend") {

                            }
                            .buttonStyle(.plain)
                            .font(Font.DesignSystem.textXsReguler)
                            .foregroundColor(Color.DesignSystem.brandColor)
                            .padding(.leading, -5)
                        }
                    }
                    .padding(.horizontal, 74)
                }
                .rowViewBackground()

                Spacer()

                buttonRow(title: "Confirm") {

                }
                .rowViewBackground()
            }
        }
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView()
    }
}
