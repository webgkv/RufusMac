import SwiftUI

/// Application entry point.
///
/// RufusMac is a single-window utility, so we use `Window` (not `WindowGroup`)
/// to keep exactly one instance. Liquid Glass is used on macOS 26+; macOS 14/15
/// get a material-based visual fallback.
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
