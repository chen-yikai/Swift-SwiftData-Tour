import SwiftData
import SwiftUI

struct TaskItemView: View {
    @Bindable var task: Task
    @Environment(\.modelContext) var modelContext

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title).strikethrough(task.done).foregroundStyle(task.done ? .secondary : .primary)
                Text(task.date.formatted()).foregroundStyle(.secondary)
            }
            Spacer()
            CheckBoxView(isCheck: $task.done)
        }
    }
}
