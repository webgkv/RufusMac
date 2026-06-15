import SwiftUI

/// Persistent attribution footer shown on every screen.
struct FooterView: View {
    var body: some View {
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
        .font(.footnote)
        .foregroundStyle(.secondary)
        .padding(.top, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Developed by \(Brand.author), \(Brand.site)")
    }
}
