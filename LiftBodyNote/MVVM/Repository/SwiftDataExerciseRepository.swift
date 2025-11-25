//
//  SwiftDataExerciseRepository.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 19/11/2025.
//

import SwiftData

final class SwiftDataExerciseRepository: ExerciseRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func addCustomExercise(
        name: String,
        muscleGroup: String,
        notes: String?
    ) throws {
        let exercise = Exercise(name: name,
                                muscleGroup: muscleGroup,
                                isUserCreated: true,
                                notes: notes
        )
            context.insert(exercise)
            try context.save()
    }
    func addSystemExercise(from preset: Exercise) throws {
        let exercise = Exercise(name: preset.name,
                                muscleGroup: preset.muscleGroup,
                                isUserCreated: false,
                                notes: nil
        )
        context.insert(exercise)
        try context.save()
    }

}
