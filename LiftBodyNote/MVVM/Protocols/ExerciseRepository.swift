//
//  ExerciseRepository.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 19/11/2025.
//

import Foundation

protocol ExerciseRepository {
    func addCustomExercise(name: String,
                           muscleGroup: String,
                           notes: String?
    ) throws
    
    func addSystemExercise(from preset: Exercise) throws
}
