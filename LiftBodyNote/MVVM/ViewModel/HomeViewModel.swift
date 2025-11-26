import SwiftUI
import SwiftData

// MARK: - ExerciseListMode

enum ExerciseListAddMode {
    case custom
    case system
}

// MARK: - ExerciseListViewModel

final class HomeViewModel: ObservableObject {
    // MARK: - Published state
    
    @Published var isAddOptionsPresented: Bool = false
    @Published var addMode: ExerciseListAddMode? = nil
    @Published var errorMessage: String? = nil
    
    // MARK: - Dependencies
    
    private(set) var repository: ExerciseRepository!
    
    init() {}
    
    func configure(context: ModelContext) {
        if repository == nil {
            self.repository = SwiftDataExerciseRepository(context: context)
        }
    }
    
    
    // MARK: - Intents
    
    func didTapAddButton() {
        isAddOptionsPresented = true
    }
    func selectCustom() {
        addMode = .custom
        isAddOptionsPresented = false
    }
    
    func addCustomExercise(
        name: String,
        muscleGroup: String,
        notes: String?
    ) {
        do {
            try repository.addCustomExercise(name: name,
                                             muscleGroup: muscleGroup,
                                             notes: notes
            )
            errorMessage = nil
            isAddOptionsPresented = false
        } catch {
            errorMessage = "Failed to save custom exercise"
        }
    }
    func addSystemExrcise(from preset: Exercise) {
        do {
            try repository.addSystemExercise(from: preset)
            errorMessage = nil
        } catch {
            errorMessage = "Failed to save system exercise"
        }
    }
    func deleteExercise(_ exercise: Exercise) {
        do {
            try repository.deleteExercise(exercise)
            errorMessage = nil
        } catch {
            errorMessage = "Failed to delete exercise"
        }
    }
}

