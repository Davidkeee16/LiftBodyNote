
import SwiftUI
import SwiftData

@main
struct LiftBodyNoteApp: App {
   
    var body: some Scene {
        WindowGroup {
            TabBarController()
        }
        // MARK: - Storage: SwiftData models for this app
        .modelContainer(for: [Exercise.self])
    }
}
