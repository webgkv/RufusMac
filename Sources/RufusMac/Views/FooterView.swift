import SwiftUI

/// Persistent attribution footer shown on every screen.
struct FooterView: View {
    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: 6) {
                Image(systemName: "heart.fill")
                    .font(.caption2)
                    .foregroundStyle(Brand.danger.opacity(0.8))
                Text("Developed by")
                Link(Brand.author, destination: Brand.siteURL)
                    .fontWeight(.semibold)
                Text("·")
                Link(Brand.site, destination: Brand.siteURL)
            }
            HStack(spacing: 6) {
                Text("Intel fork by")
                Link(Brand.intelForkLabel, destination: Brand.intelForkURL)
                    .fontWeight(.semibold)
            }
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
        .padding(.top, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "Developed by \(Brand.author), \(Brand.site). Intel fork by \(Brand.intelForkLabel)"
        )
    }
}
