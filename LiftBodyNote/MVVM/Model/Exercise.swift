
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

