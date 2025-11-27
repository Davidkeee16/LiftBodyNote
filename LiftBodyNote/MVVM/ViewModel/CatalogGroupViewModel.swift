//
//  CatalogGroupViewModel.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 27/11/2025.
//

import Foundation

// MARK: - CatalogViewModel

final class CatalogGroupViewModel: ObservableObject {
    
    @Published private(set) var exercises: [Exercise] = []
    
    private let muscleGroup: String
    
    init(muscleGroup: String) {
        self.muscleGroup = muscleGroup
    }
    
    func update(with userExercises: [Exercise]) {
        let systemInGroup = Exercise.systemCatalog().filter {
            $0.muscleGroup == muscleGroup
        }
        let usedKey = Set(userExercises.map { key(for: $0) })
        
        let available: [Exercise] = systemInGroup.filter { exercise in
            let k = key(for: exercise)
            return !usedKey.contains(k)
        }
        .sorted { lhs, rhs in
            lhs.name < rhs.name
        }
        
        self.exercises = available
    }
    private func key(for exercise: Exercise) -> String {
        exercise.name.lowercased() + "|" + exercise.muscleGroup.lowercased()
    }
}
