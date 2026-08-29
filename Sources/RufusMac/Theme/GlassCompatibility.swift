import SwiftUI

/// Shape for `rufusGlass` — maps to Liquid Glass shapes on macOS 26+ and
/// matching material fills on macOS 14/15.
enum RufusGlassShape {
    case roundedRect(CGFloat)
    case capsule
}

/// Groups child glass views so they can morph together on macOS 26+.
/// On earlier systems this is a transparent pass-through.
struct CompatibleGlassContainer<Content: View>: View {
    var spacing: CGFloat = 0
    @ViewBuilder var content: () -> Content

    var body: some View {
        if #available(macOS 26.0, *) {
            GlassEffectContainer(spacing: spacing) {
                content()
            }
        } else {
            content()
        }
    }
}

extension View {
    /// Liquid Glass on macOS 26+; `.ultraThinMaterial` (+ optional tint) on 14/15.
    @ViewBuilder
    func rufusGlass(
        _ shape: RufusGlassShape,
        tint: Color? = nil,
        interactive: Bool = false
    ) -> some View {
        if #available(macOS 26.0, *) {
            switch shape {
            case .roundedRect(let radius):
                if let tint {
                    if interactive {
                        self.glassEffect(.regular.tint(tint).interactive(), in: .rect(cornerRadius: radius))
                    } else {
                        self.glassEffect(.regular.tint(tint), in: .rect(cornerRadius: radius))
                    }
                } else if interactive {
                    self.glassEffect(.regular.interactive(), in: .rect(cornerRadius: radius))
                } else {
                    self.glassEffect(.regular, in: .rect(cornerRadius: radius))
                }
            case .capsule:
                if let tint {
                    if interactive {
                        self.glassEffect(.regular.tint(tint).interactive(), in: .capsule)
                    } else {
                        self.glassEffect(.regular.tint(tint), in: .capsule)
                    }
                } else if interactive {
                    self.glassEffect(.regular.interactive(), in: .capsule)
                } else {
                    self.glassEffect(.regular, in: .capsule)
                }
            }
        } else {
            self.background { FallbackGlassFill(shape: shape, tint: tint) }
        }
    }

    /// `.glassProminent` on macOS 26+; `.borderedProminent` on 14/15.
    @ViewBuilder
    func rufusPrimaryButtonStyle() -> some View {
        if #available(macOS 26.0, *) {
            self.buttonStyle(.glassProminent)
        } else {
            self.buttonStyle(.borderedProminent)
        }
    }
}

private struct FallbackGlassFill: View {
    let shape: RufusGlassShape
    let tint: Color?

    var body: some View {
        switch shape {
        case .roundedRect(let radius):
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay {
                    if let tint {
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .fill(tint)
                    }
                }
        case .capsule:
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay {
                    if let tint {
                        Capsule().fill(tint)
                    }
                }
        }
    }
}
