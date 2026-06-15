import SwiftUI

/// Application entry point.
///
/// RufusMac is a single-window utility, so we use `Window` (not `WindowGroup`)
/// to keep exactly one instance. The whole UI is rendered on Apple's Liquid Glass
/// material, available natively on macOS 26 (Tahoe) and later.
@main
struct RufusMacApp: App {
    var body: some Scene {
        Window(Brand.name, id: "main") {
            ContentView()
                .frame(minWidth: 660, idealWidth: 700, minHeight: 800)
        }
        .windowResizability(.contentMinSize)
        .defaultSize(width: 700, height: 820)
        .commands {
            CommandGroup(replacing: .appInfo) {
                Button("About \(Brand.name)") { /* wired in M6 */ }
            }
        }
    }
}
