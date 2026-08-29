import Foundation

/// Single source of truth for app identity, shared by the SwiftUI app, the
/// `rmctl` CLI, and the test suite.
public enum RufusMacInfo {
    public static let name = "RufusMac"
    public static let version = "0.1.0"
    public static let tagline = "Bootable USB, beautifully done."
    public static let author = "Harith Dilshan"
    public static let site = "h4rithd.com"
    public static let repo = "https://github.com/h4rithd/RufusMac"
    /// This Intel (x86_64) fork.
    public static let intelForkRepo = "https://github.com/webgkv/RufusMac"
    public static let intelForkLabel = "webgkv"
}
