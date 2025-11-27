//
//  CatalogGroupView.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 27/11/2025.
//

import SwiftUI
import SwiftData
// MARK: CatalogGroupView

struct CatalogGroupView: View {
    // MARK: - Dependencies
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Exercise.name) private var userExercises: [Exercise]
    
    @StateObject private var viewModel: CatalogGroupViewModel
    
    init(muscleGroup: String) {
        _viewModel = StateObject(
            wrappedValue: CatalogGroupViewModel(muscleGroup: muscleGroup)
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        List {
            if viewModel.exercises.isEmpty {
                Text("No more exercises in this group.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                ForEach(viewModel.exercises) { exercise in
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
        .navigationTitle(title)
        .onAppear {
            viewModel.update(with: userExercises)
        }
        .onChange(of: userExercises) { _, newValue in
            viewModel.update(with: newValue)
            
        }
    }
    
    // MARK: - Computed Properties
    
    private var title: String {
        viewModel.exercises.first?.muscleGroup ?? "Group"
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
    CatalogGroupView(muscleGroup: "BananaGym")
}
