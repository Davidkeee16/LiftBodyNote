
import SwiftUI
import SwiftData

@main
struct LiftBodyNoteApp: App {
   
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        // MARK: - Storage: SwiftData models for this app
        .modelContainer(for: [Exercise.self])
    }
}
