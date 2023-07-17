import SwiftUI

@MainActor
public struct MyForm<Content: View>: View
{
    private let formBuilder: (() -> Content) -> AnyView
    private let content: () -> Content

    public init<FormLike: View>(
        formBuilder: @escaping (() -> Content) -> FormLike,
        @ViewBuilder content: @escaping () -> Content
    )
    {
        self.formBuilder = { AnyView(formBuilder($0)) }
        self.content = content
    }

    /// Initializer with `formBuilder` being specialized to `Form`.
    public init(
        @ViewBuilder _ content: @escaping () -> Content
    )
    {
        self.init(
            formBuilder: { content in
                AnyView(
                    Form { content() }
                        .padding(.horizontal, -20)
                        .formViewBackground(.white)
                        .environment(\.defaultMinListRowHeight, 10)
                )
            },
            content: content
        )
    }

    public var body: some View
    {
        formBuilder { content() }
    }
}
