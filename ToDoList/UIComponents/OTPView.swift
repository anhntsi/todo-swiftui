//
//  OTPView.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 10/06/2023.
//

import SwiftUI
import Combine

struct OTPView: View {
    @Binding private var otpCode: String
    private var otpCodeLength: Int
    @FocusState private var isFocused: Bool?

    init(otpCode: Binding<String>, otpCodeLength: Int = 4) {
        self._otpCode = otpCode
        self.otpCodeLength = otpCodeLength
    }

    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                TextField("", text: $otpCode)
                    .frame(width: 0, height: 0, alignment: .center)
                    .font(Font.system(size: 0))
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .onChange(of: otpCode) { _ in
                        limitText(otpCodeLength)
                    }
                    .focused($isFocused, equals: true)
                    .task {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                        {
                            self.isFocused = true
                        }
                    }
                    .padding()
                HStack {
                    ForEach(0..<otpCodeLength, id: \.self) { index in
                        ZStack {
                            Text(self.getPin(at: index))
                                .font(Font.DesignSystem.textXlMedium)
                                .foregroundColor(Color.DesignSystem.brandColor)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.DesignSystem.brandColor)
                                .padding(.trailing, 5)
                                .padding(.leading, 5)
                                .opacity(self.otpCode.count <= index ? 1 : 0)
                        }
                    }
                }
            }
        }
    }

    private func getPin(at index: Int) -> String {
        guard self.otpCode.count > index else {
            return ""
        }
        return self.otpCode[index]
    }

    private func limitText(_ upper: Int) {
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}

struct OTPView_Previews: PreviewProvider {
    @State static var otpCode: String = ""
    static var previews: some View {
        OTPView(otpCode: $otpCode)
    }
}
