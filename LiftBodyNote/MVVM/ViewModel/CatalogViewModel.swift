
import Foundation

// MARK: - CatalogViewModel (System Exercises)

final class CatalogViewModel: ObservableObject {
    
    // MARK: Published State
    
    @Published private(set) var sections: [CatalogSection] = []
    
    // MARK: - Update View
    
    func update(with userExercise: [Exercise]) {
        let systemExercises = Exercise.systemCatalog()
        
        let usedKeys: Set<String> = Set(
            userExercise.map { exercise in
                Self.key(for: exercise)
            }
        )
        let availableSystemExercises: [Exercise] = systemExercises.filter { exercise in
            let key = Self.key(for: exercise)
            return !usedKeys.contains(key)
        }
        buildSections(from: availableSystemExercises)
    }
    
    
    // MARK: - Private Methods
    private static func key(for exercise: Exercise) -> String {
        exercise.name.lowercased() + "|" + exercise.muscleGroup.lowercased()
    }
    
    private func buildSections(from allExercises: [Exercise]) {
        let grouped = Dictionary(grouping: allExercises) { exercise in
            exercise.muscleGroup
        }
        let mappedSections: [CatalogSection] = grouped.map { (groupName, exercisesInGroup) in
            CatalogSection(muscleGroup: groupName, exercises: exercisesInGroup)
        }
        let sorted = mappedSections.sorted { lhs, rhs in
            lhs.muscleGroup < rhs.muscleGroup
        }
        
        self.sections = sorted
    }
    
 
}


