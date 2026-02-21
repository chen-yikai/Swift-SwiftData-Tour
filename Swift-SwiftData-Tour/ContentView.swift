import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(sort: \Task.createdAt, order: .reverse) var tasks: [Task]
    @Environment(\.modelContext) var modelContext

    @State var isPresentingNewTaskSheet = false
    @State var newTaskTitle: String = ""
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "checklist").symbolRenderingMode(
                    .hierarchical
                )
                Text("Task Manager")
            }.padding()
                .font(.title)
                .fontWeight(.medium)
            List {
                ForEach(tasks) { task in
                    TaskItemView(task: task)
                }.onDelete(perform: {
                    indexSet in
                    for index in indexSet {
                        let taskToDelete = tasks[index]
                        modelContext.delete(taskToDelete)
                    }
                })
            }.listStyle(.plain)
            Button("Show Sheet", systemImage: "plus") {
                isPresentingNewTaskSheet = true
            }.padding()
                .sheet(isPresented: $isPresentingNewTaskSheet) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("New Task")
                            .font(.title2).fontWeight(.medium)
                        TextField(
                            "Title",
                            text: $newTaskTitle
                        )
                        DatePicker(
                            "Date",
                            selection: $selectedDate,
                            displayedComponents: [.date, .hourAndMinute]
                        )
                        HStack {
                            Spacer()
                            Button("Done") {
                                let newTask = Task(
                                    title: newTaskTitle,
                                    date: selectedDate
                                )
                                modelContext.insert(newTask)
                                isPresentingNewTaskSheet = false
                            }.buttonStyle(.glassProminent)
                        }.padding(.top)
                    }
                    .padding()
                    .presentationDetents([.fraction(0.40), .medium])
                    .presentationDragIndicator(.visible)
                }
        }
    }
}

#Preview {
    ContentView().modelContainer(for: Task.self)
}
