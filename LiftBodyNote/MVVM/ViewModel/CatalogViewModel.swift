
import Foundation

// MARK: - CatalogViewModel (System Exercises)

final class CatalogViewModel: ObservableObject {
    
    // MARK: Published State
    
    
    @Published private(set) var groups: [MuscleGroupItem] = []
    
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
        buildGroups(from: availableSystemExercises)
    }
    
    
    // MARK: - Private Methods
    private static func key(for exercise: Exercise) -> String {
        exercise.name.lowercased() + "|" + exercise.muscleGroup.lowercased()
    }
    
    private func buildGroups(from allExercises: [Exercise]) {
        let grouped = Dictionary(grouping: allExercises) { exercise in
            exercise.muscleGroup
        }
        let mapped: [MuscleGroupItem] = grouped.map { (groupName, exercisesInGroup) in
            MuscleGroupItem(name: groupName, exerciseCount: exercisesInGroup.count)
        }
        let sorted = mapped.sorted { $0.name < $1.name}
        
        
        self.groups = sorted
    }
    
 
}


