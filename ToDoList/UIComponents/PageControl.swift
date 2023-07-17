//
//  PageControl.swift
//  ToDoList
//
//  Created by The Anh Nguyen on 26/05/2023.
//

import SwiftUI

struct PageControl: View {
    let numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            ForEach(0..<numberOfPages, id: \.self) { pageIndex in
                Ellipse()
                    .fill(pageIndex == currentPage ? Color.DesignSystem.brandColor : Color.DesignSystem.aliceBlue)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(numberOfPages: 3, currentPage: .constant(1))
    }
}
