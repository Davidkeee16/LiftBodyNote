
import SwiftUI
import SwiftData

struct HomeView: View {
    
    // MARK: - SwiftData
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Exercise.name) private var exercises: [Exercise]
    
    // MARK: - ViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if exercises.isEmpty {
                    emptyStateView
                } else {
                    exerciseListView
                }
            }
            .navigationTitle("My Exercises")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.didTapAddButton()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isAddOptionsPresented) {
                AddCustomExerciseView { name, group, notes in
                    viewModel.addCustomExercise(name: name, muscleGroup: group, notes: notes)
                }
            }
        }
        .task {
            viewModel.configure(context: modelContext)
        }
    }
    // MARK: - Subviews
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "Dumbell")
                .font(.system(size: 48))
            Text("No exercise yet")
                .font(.headline)
            Text("Tap + to create your first custom exercise or open the catalog to add system exercises.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    private var exerciseListView: some View {
        List {
            ForEach(exercises) { exercise in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(exercise.name)
                            .font(.headline)
                        Text(exercise.muscleGroup)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    if exercise.isUserCreated {
                        Text("Custom")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(.blue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .onDelete(perform: handleDelete)
        }
    }
    
    // MARK: - Delete
    
    private func handleDelete(at offsets: IndexSet) {
        for index in offsets {
            let exercise = exercises[index]
            viewModel.deleteExercise(exercise)
        }
    }
}


#Preview {
    let schema = Schema([
        Exercise.self
    ])
    let configuration = ModelConfiguration(schema: schema,
                                           isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: schema,
        configurations: [configuration]
    )
    HomeView()
        .modelContainer(container)
        .environment(\.colorScheme, .light)
}
