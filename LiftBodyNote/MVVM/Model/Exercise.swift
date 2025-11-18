
import Foundation
import SwiftData

@Model
final class Exercise {
    // MARK: - Identity
    @Attribute(.unique) var id: UUID
    
    // MARK: - Properties
    var name: String
    var muscleGroup: String
    var isUserCreated: Bool
    var notes: String?
    
    init(name: String, muscleGroup: String, isUserCreated: Bool, notes: String? = nil) {
        self.id = UUID()
        self.name = name
        self.muscleGroup = muscleGroup
        self.isUserCreated = isUserCreated
        self.notes = notes
    }
}

/*
extension Exercise {
    
    static func loseWeight() -> [Exercise] {
            
            return [
                Exercise(muscleGroup: "Full Body", exercise: "Burpees", sets: 3, reps: 15),
                Exercise(muscleGroup: "Legs", exercise: "Bodyweight Squats", sets: 3, reps: 20),
                Exercise(muscleGroup: "Upper Body", exercise: "Push-ups", sets: 3, reps: 15),
                Exercise(muscleGroup: "Core", exercise: "Mountains Climbers", sets: 3, reps: 30),
                Exercise(muscleGroup: "Full Body", exercise: "Jumping Jacks", sets: 3, reps: 40)
            ]
        }
        static func buildMuscle() -> [Exercise] {
            
            return [
                Exercise(muscleGroup: "Chest", exercise: "Barbell Bench Press", sets: 4, reps: 10),
                Exercise(muscleGroup: "Back", exercise: "Pull-ups", sets: 4, reps: 8),
                Exercise(muscleGroup: "Legs", exercise: "Barbell Squats", sets: 4, reps: 8),
                Exercise(muscleGroup: "Shoulders", exercise: "Dumbbell Shoulder Press", sets: 3, reps: 10),
                Exercise(muscleGroup: "Arms", exercise: "Dips on Parallel Bars", sets: 3, reps: 12)
            ]
            
        }
        static func becomeStronger() -> [Exercise] {
            
            return [
                Exercise(muscleGroup: "Chest", exercise: "Barbell Bench Press", sets: 5, reps: 5),
                Exercise(muscleGroup: "Legs", exercise: "Deadlift", sets: 5, reps: 5),
                Exercise(muscleGroup: "Back", exercise: "Barbell Rows", sets: 4, reps: 6),
                Exercise(muscleGroup: "Shoulders", exercise: "Overhead Press", sets: 4, reps: 5),
                Exercise(muscleGroup: "Core", exercise: "Weighted Plank", sets: 3, reps: 1)
            ]
}

*/
