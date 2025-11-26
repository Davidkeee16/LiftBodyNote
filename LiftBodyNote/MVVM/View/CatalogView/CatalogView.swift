//
//  Catalogue View.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 25/11/2025.
//

import SwiftUI
import SwiftData

struct CatalogView: View {
    
    // MARK: - SwiftData
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Exercise.name) private var userExercises: [Exercise]
    // MARK: ViewModel
    @StateObject private var viewModel = CatalogViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            List {
                if viewModel.sections.isEmpty {
                    Text("All catalog exercises are already added to your list.")
                } else {
                    ForEach(viewModel.sections) { section in
                        Section(header: Text(section.muscleGroup)) {
                            ForEach(section.exercises) { exercise in
                                HStack {
                                    Text(exercise.name)
                                    
                                    Spacer()
                                    
                                    Button {
                                        addToMyList(from: exercise)
                                    } label: {
                                        Image(systemName: "plus.circle")
                                    }
                                    .buttonStyle(.borderless)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Catalog")
        }
        .onAppear {
            viewModel.update(with: userExercises)
        }
        .onChange(of: userExercises) { _, newValue in
            viewModel.update(with: newValue)
        }
    }
    
    // MARK: - Actions
    private func addToMyList(from template: Exercise) {
        let exercise = Exercise(name: template.name, muscleGroup: template.muscleGroup, isUserCreated: false, notes: nil)
        
        modelContext.insert(exercise)
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save exercise from catalog")
        }
    }
}


#Preview {
    CatalogView()
}
