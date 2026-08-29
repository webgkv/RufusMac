import SwiftUI

/// Segmented control: Liquid Glass morph on macOS 26+, material capsules on 14/15.
struct GlassSegmented<Value: Hashable>: View {
    struct Item: Identifiable {
        let value: Value
        let label: String
        let systemImage: String
        var id: Value { value }
    }

    let items: [Item]
    @Binding var selection: Value

    var body: some View {
        CompatibleGlassContainer(spacing: 6) {
            HStack(spacing: 6) {
                ForEach(items) { item in
                    let isSelected = item.value == selection
                    Button {
                        withAnimation(.smooth(duration: 0.35)) { selection = item.value }
                    } label: {
                        Label(item.label, systemImage: item.systemImage)
                            .font(.callout.weight(.medium))
                            .labelStyle(.titleAndIcon)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(isSelected ? .primary : .secondary)
                    .rufusGlass(
                        .capsule,
                        tint: isSelected ? Brand.accent.opacity(0.55) : nil,
                        interactive: true
                    )
                }
            }
        }
    }
}
