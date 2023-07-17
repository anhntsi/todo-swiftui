import SwiftUI

// MARK: - Constructors

extension FormView
{
    @ViewBuilder
    public func socialButtonRow(
        insets: EdgeInsets? = nil,
        googleAction: @escaping () -> Void,
        facebookAction: @escaping () -> Void,
        twitterAction: @escaping () -> Void
    ) -> SocialButtonRow
    {
        SocialButtonRow(
            googleAction: googleAction,
            facebookAction: facebookAction,
            twitterAction: twitterAction
        )
    }
}

// MARK: - SocialButtonRow

@MainActor
public struct SocialButtonRow: View, ButtonView
{
    private let insets: EdgeInsets?
    private let googleAction: () -> Void
    private let facebookAction: () -> Void
    private let twitterAction: () -> Void

    internal init(
        insets: EdgeInsets? = nil,
        googleAction: @escaping () -> Void,
        facebookAction: @escaping () -> Void,
        twitterAction: @escaping () -> Void
    )
    {
        self.insets = insets
        self.googleAction = googleAction
        self.facebookAction = facebookAction
        self.twitterAction = twitterAction
    }

    public var body: some View
    {
        HStackRow(insets: insets) {
            Spacer()
            secondaryLargeIconButton(icon: Image("ic-google"), renderAsTemplate: false, action: googleAction)
                .frame(width: 70, height: 70)
            Spacer(minLength: 40)
            secondaryLargeIconButton(icon: Image("ic-facebook"), renderAsTemplate: false, action: facebookAction)
                .frame(width: 70, height: 70)
            Spacer(minLength: 40)
            secondaryLargeIconButton(icon: Image("ic-twitter"), renderAsTemplate: false, action: twitterAction)
                .frame(width: 70, height: 70)
            Spacer()
        }
    }
}
