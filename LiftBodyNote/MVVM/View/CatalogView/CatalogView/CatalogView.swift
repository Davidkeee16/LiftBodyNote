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
                if viewModel.groups.isEmpty {
                    Text("All catalog exercises are already in your list.")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ForEach(viewModel.groups) { group in
                        NavigationLink {
                            CatalogGroupView(muscleGroup: group.name)
                        } label: {
                            HStack {
                                Text(group.name)
                                    .font(.headline)
                                Spacer()
                                
                                Text("\(group.exerciseCount)")
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
}


#Preview {
    CatalogView()
}
