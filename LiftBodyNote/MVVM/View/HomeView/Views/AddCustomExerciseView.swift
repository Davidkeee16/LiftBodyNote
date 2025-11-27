//
//  AddCustomExerciseView.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 26/11/2025.
//

import SwiftUI

// MARK: - AddCustomExerciseView

struct AddCustomExerciseView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var muscleGroup: String = ""
    @State private var notes: String = ""
    
    let onSave: (String, String, String?) -> Void
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Exercise name", text: $name)
                }
                Section("Muscle group") {
                    TextField("e.g. Chest, Legs", text: $muscleGroup)
                }
                Section("Notes") {
                    TextField("Optional notes", text: $notes)
                }
            }
            
            .navigationTitle("New exercise")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }                    }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(name, muscleGroup, notes.isEmpty ? nil : notes)
                        dismiss()
                    }
                    .disabled(name.isEmpty || muscleGroup.isEmpty)
                }
            }
        }
    }
}

#Preview("Add custom exercise – light") {
    AddCustomExerciseView { name, muscleGroup, notes in
        // Тут в превью просто печатаем, что бы "сохранили"
        print("Preview save → name: \(name), group: \(muscleGroup), notes: \(notes ?? "nil")")
    }
    .environment(\.colorScheme, .light)
}
