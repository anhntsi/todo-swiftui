import SwiftUI

public extension Font {
    /// Namespace to prevent naming collisions with static accessors on
    /// SwiftUI's Font.
    ///
    /// Xcode's autocomplete allows for easy discovery of design system fonts.
    /// At any call site that requires a font, type `Font.DesignSystem.<esc>`
    struct DesignSystem {
        public static let text3XlReguler = Font.custom("Poppins-Regular", size: 40)
        public static let text3XlMedium = Font.custom("Poppins-Medium", size: 40)
        public static let text3XlSemibold = Font.custom("Poppins-SemiBold", size: 40)
        public static let text3XlBold = Font.custom("Poppins-Bold", size: 40)
        public static let text2XlReguler = Font.custom("Poppins-Regular", size: 32)
        public static let text2XlMedium = Font.custom("Poppins-Medium", size: 32)
        public static let text2XlSemibold = Font.custom("Poppins-SemiBold", size: 32)
        public static let text2XlBold = Font.custom("Poppins-Bold", size: 32)
        public static let textXlReguler = Font.custom("Poppins-Regular", size: 24)
        public static let textXlMedium = Font.custom("Poppins-Medium", size: 24)
        public static let textXlSemibold = Font.custom("Poppins-SemiBold", size: 24)
        public static let textXlBold = Font.custom("Poppins-Bold", size: 24)
        public static let textLgReguler = Font.custom("Poppins-Regular", size: 20)
        public static let textLgMedium = Font.custom("Poppins-Medium", size: 20)
        public static let textLgSemibold = Font.custom("Poppins-SemiBold", size: 20)
        public static let textLgBold = Font.custom("Poppins-Bold", size: 20)
        public static let textBaseReguler = Font.custom("Poppins-Regular", size: 16)
        public static let textBaseMedium = Font.custom("Poppins-Medium", size: 16)
        public static let textBaseSemibold = Font.custom("Poppins-SemiBold", size: 16)
        public static let textBaseBold = Font.custom("Poppins-Bold", size: 16)
        public static let textSmReguler = Font.custom("Poppins-Regular", size: 14)
        public static let textSmMedium = Font.custom("Poppins-Medium", size: 14)
        public static let textSmSemibold = Font.custom("Poppins-SemiBold", size: 14)
        public static let textSmBold = Font.custom("Poppins-Bold", size: 14)
        public static let textXsBold = Font.custom("Poppins-Bold", size: 12)
        public static let textXsSemibold = Font.custom("Poppins-SemiBold", size: 12)
        public static let textXsMedium = Font.custom("Poppins-Medium", size: 12)
        public static let textXsReguler = Font.custom("Poppins-Regular", size: 12)
        public static let text2XsBold = Font.custom("Poppins-Bold", size: 10)
        public static let text2XsSemibold = Font.custom("Poppins-SemiBold", size: 10)
        public static let text2XsMedium = Font.custom("Poppins-Medium", size: 10)
        public static let text2XsReguler = Font.custom("Poppins-Regular", size: 10)
    }
}
