import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func hstackRow<Content: View>(
        insets: EdgeInsets? = nil,
        alignment: VerticalAlignment = .center,
        @ViewBuilder content: @escaping () -> Content
    ) -> HStackRow<Content>
    {
        ContainerRow<HStack<Content>, Content>(
            insets: insets,
            alignment: alignment,
            content: content
        )
    }

    @ViewBuilder
    public func vstackRow<Content: View>(
        insets: EdgeInsets? = nil,
        alignment: HorizontalAlignment = .center,
        @ViewBuilder content: @escaping () -> Content
    ) -> VStackRow<Content>
    {
        VStackRow<Content>(
            insets: insets,
            alignment: alignment,
            content: content
        )
    }
}

// MARK: - HStackRow / VStackRow

public typealias HStackRow<Content: View> = ContainerRow<HStack<Content>, Content>
public typealias VStackRow<Content: View> = ContainerRow<VStack<Content>, Content>
