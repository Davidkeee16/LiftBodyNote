//
//  SuggestedExercises.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 19/11/2025.
//

import Foundation

extension Exercise {
    
    static func systemCatalog() -> [Exercise] {
        return [
            Exercise(name: "Burpees", muscleGroup: "Full Body", isUserCreated: false),
            Exercise(name: "Bodyweight Squats", muscleGroup: "Legs", isUserCreated: false),
            Exercise(name: "Push-ups", muscleGroup: "Upper Body", isUserCreated: false),
            Exercise(name: "Mountains Climbers", muscleGroup: "Core", isUserCreated: false),
            Exercise(name: "Jumping Jacks", muscleGroup: "Full Body", isUserCreated: false),
            Exercise(name: "Barbell Bench Press", muscleGroup: "Chest", isUserCreated: false),
            Exercise(name: "Pull-ups", muscleGroup: "Back", isUserCreated: false),
            Exercise(name: "Barbell Squats", muscleGroup: "Legs", isUserCreated: false),
            Exercise(name: "Dumbbel Shoulder Press", muscleGroup: "Shoulders", isUserCreated: false),
            Exercise(name: "Dips on Parallel Bars", muscleGroup: "Arms", isUserCreated: false),
            Exercise(name: "Deadlift", muscleGroup: "Legs", isUserCreated: false),
            Exercise(name: "Barbell Rows", muscleGroup: "Back", isUserCreated: false),
            Exercise(name: "Overhead Press", muscleGroup: "Shoulders", isUserCreated: false),
            Exercise(name: "Weighted Plank", muscleGroup: "Core", isUserCreated: false)
        ]
    }
}
