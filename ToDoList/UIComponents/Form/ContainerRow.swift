import SwiftUI

// MARK: - ContainerRow

@MainActor
public struct ContainerRow<Container: View, Content: View>: View
{
    private let containerInit: (() -> Content) -> Container
    private let content: () -> Content
    private let insets: EdgeInsets?
    private let color: Color

    internal init(
        color: Color = .clear,
        insets: EdgeInsets? = nil,
        containerInit: @escaping (() -> Content) -> Container,
        @ViewBuilder content: @escaping () -> Content
    )
    {
        self.color = color
        self.insets = insets
        self.containerInit = containerInit
        self.content = content
    }

    /// Creates ``HStackRow``.
    internal init(
        color: Color = .clear,
        insets: EdgeInsets? = nil,
        alignment: VerticalAlignment = .center,
        @ViewBuilder content: @escaping () -> Content
    )
        where Container == HStack<Content>
    {
        self.color = color
        self.insets = insets
        self.containerInit = { HStack(alignment: alignment, content: $0) }
        self.content = content
    }

    /// Creates ``VStackRow``.
    internal init(
        color: Color = .clear,
        insets: EdgeInsets? = nil,
        alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping () -> Content
    )
        where Container == VStack<Content>
    {
        self.color = color
        self.insets = insets
        self.containerInit = { VStack(alignment: alignment, content: $0) }
        self.content = content
    }

    public var body: some View
    {
        _body
    }

    @ViewBuilder
    private var _body: some View
    {
        containerInit { content() }
            .rowViewBackground(color)
            .listRowInsets(insets ?? EdgeInsets())
    }
}
