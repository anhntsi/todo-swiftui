import SwiftUI

public extension Color {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Color.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system colors.
    /// At any call site that requires a color, type `Color.DesignSystem.<esc>`
    struct DesignSystem {
        public static let brandColor = Color(red: 0, green: 0.4313725531101227, blue: 0.9137254953384399, opacity: 1)
        public static let headerColor = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let subHeaderColor = Color(red: 0.27843138575553894, green: 0.27843138575553894, blue: 0.27843138575553894, opacity: 1)
        public static let textColor = Color(red: 0.29019609093666077, green: 0.27450981736183167, blue: 0.27450981736183167, opacity: 1)
        public static let aliceBlue = Color(red: 0.9333333373069763, green: 0.9607843160629272, blue: 0.9921568632125854, opacity: 1)
        public static let white = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let black = Color(red: 0, green: 0, blue: 0, opacity: 1)
        public static let darkGray = Color(red: 0.6045029759407043, green: 0.6045029759407043, blue: 0.6045029759407043, opacity: 1)
        public static let disabledColor = Color(red: 0.7764706015586853, green: 0.7607843279838562, blue: 0.7607843279838562, opacity: 1)
        public static let destructiveColor = Color(red: 0.7960784435272217, green: 0.18431372940540314, blue: 0.18431372940540314, opacity: 1)
        public static let brandPressedColor = Color(red: 0.062745101749897, green: 0.3607843220233917, blue: 0.8588235378265381, opacity: 1)
    }
}

