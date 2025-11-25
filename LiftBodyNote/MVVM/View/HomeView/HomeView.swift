
import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Exercise.name) private var exercises: [Exercise]
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            Text("Zdarova")
        }
        .task {
            viewModel.configure(context: modelContext)
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
