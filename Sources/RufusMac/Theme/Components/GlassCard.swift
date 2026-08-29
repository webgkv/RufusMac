import SwiftUI

/// A rounded content container on Liquid Glass (macOS 26+) or material fallback.
///
/// Wrap related controls in a `GlassCard`. Place multiple cards inside a
/// `CompatibleGlassContainer` so their glass can blend on systems that support it.
struct GlassCard<Content: View>: View {
    var cornerRadius: CGFloat = 22
    @ViewBuilder var content: Content

    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .rufusGlass(.roundedRect(cornerRadius))
    }
}
