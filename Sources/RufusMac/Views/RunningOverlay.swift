import SwiftUI

/// Full-window overlay shown while a privileged operation is in progress.
struct RunningOverlay: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.35).ignoresSafeArea()
            VStack(spacing: 14) {
                ProgressView().controlSize(.large)
                Text("Working…")
                    .font(.headline)
                Text("You may be prompted for your administrator password.\nPlease don't unplug the drive.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            .padding(28)
            .glassEffect(.regular, in: .rect(cornerRadius: 22))
        }
        .transition(.opacity)
    }
}
