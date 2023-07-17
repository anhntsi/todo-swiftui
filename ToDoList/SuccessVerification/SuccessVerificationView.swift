//
//  SuccessVerificationView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 10/06/2023.
//

import SwiftUI

struct SuccessVerificationView: View, FormView {
    var body: some View {
        MyForm {
            appNameRow()
                .rowViewBackground()

            Spacer(minLength: 30)
            
            subHeaderTextRow(title: "Verify Account")
                .rowViewBackground()

            Spacer(minLength: 25)

            imageRow(name: "verify-confirmed")
                .rowViewBackground()

            Spacer()
            
            subHeaderTextRow(title: "Your Account has been\nVerified Successfully!")
                .rowViewBackground()

            Spacer(minLength: 60)

            buttonRow(title: "Go to Dashboard") {

            }
            .rowViewBackground()
        }
    }
}

struct SuccessVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessVerificationView()
    }
}
