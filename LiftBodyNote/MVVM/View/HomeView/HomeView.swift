
import SwiftUI
import SwiftData

struct HomeView: View {
    
    // MARK: - SwiftData
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Exercise.name) private var exercises: [Exercise]
    
    // MARK: - ViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - Grouped Data
    
    private var groupedExercises: [(group: String, items: [Exercise])] {
        let dictionary = Dictionary(grouping: exercises) { exercise in
            exercise.muscleGroup
        }
        let mapped: [(group: String, items: [Exercise])] = dictionary.map { (key, value) in
            let sortedItems = value.sorted { lhs, rhs in
                lhs.name < rhs.name
            }
            return (group: key, items: sortedItems)
        }
        let sorted = mapped.sorted { lhs, rhs in
            lhs.group < rhs.group
        }
        return sorted
    }
    
    // MARK: - Body
    
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
            ForEach(groupedExercises, id: \.group) { section in
                Section(header: Text(section.group)) {
                    ForEach(section.items) { exercise in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(exercise.name)
                                    .font(.headline)
                            }
                            Spacer()
                        }
                    }
                    .onDelete { offset in
                        handleDelete(in: section, offsets: offset)
                    }
                }
            }
        }
    }
    
    // MARK: - Delete
    
    private func handleDelete(in section: (group: String, items:[Exercise]), offsets: IndexSet) {
        for index in offsets {
            let exercise = section.items[index]
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
