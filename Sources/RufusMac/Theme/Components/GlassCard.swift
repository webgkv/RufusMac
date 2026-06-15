import SwiftUI

/// A rounded content container rendered on the Liquid Glass material.
///
/// Wrap related controls in a `GlassCard` to get the translucent, refractive
/// look that defines the RufusMac UI. Place multiple cards inside a
/// `GlassEffectContainer` so their glass blends and morphs together.
struct GlassCard<Content: View>: View {
    var cornerRadius: CGFloat = 22
    @ViewBuilder var content: Content

    var body: some View {
        content
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .glassEffect(.regular, in: .rect(cornerRadius: cornerRadius))
    }
}
