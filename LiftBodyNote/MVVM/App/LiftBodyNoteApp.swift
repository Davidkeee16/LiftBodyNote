
import SwiftUI
import SwiftData

@main
struct LiftBodyNoteApp: App {
   
    var body: some Scene {
        WindowGroup {
            ExerciseView()
        }
        // MARK: - Storage: SwiftData models for this app
        .modelContainer(for: [Exercise.self])
    }
}
