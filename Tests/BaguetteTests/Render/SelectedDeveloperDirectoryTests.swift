import Testing
@testable import Baguette

@Suite("SelectedDeveloperDirectory")
struct SelectedDeveloperDirectoryTests {
    @Test func `explicit Xcode selection wins over the system default`() {
        let selected = VerifiedDeviceAssets.selectedDeveloperDir(
            environment: ["DEVELOPER_DIR": "/Applications/Selected Xcode.app/Contents/Developer"],
            fallback: { "/Applications/Default Xcode.app/Contents/Developer" }
        )
        #expect(selected == "/Applications/Selected Xcode.app/Contents/Developer")
    }

    @Test func `missing selection falls back to the system Xcode`() {
        let selected = VerifiedDeviceAssets.selectedDeveloperDir(
            environment: [:],
            fallback: { "/Applications/Default Xcode.app/Contents/Developer" }
        )
        #expect(selected == "/Applications/Default Xcode.app/Contents/Developer")
    }
}
