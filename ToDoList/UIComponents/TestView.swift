//
//  TestView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 10/06/2023.
//

import SwiftUI

struct TestView: View {
    @State private var test: String = ""

    var body: some View {
        OTPView(otpCode: $test)
            .padding(.horizontal, 74)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
