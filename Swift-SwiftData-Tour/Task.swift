import Foundation
import SwiftData

@Model
class Task {
    var done: Bool
    var title: String
    var date: Date
    var createdAt: Date

    init(done: Bool = false, title: String, date: Date, createdAt: Date = .now)
    {
        self.done = done
        self.title = title
        self.date = date
        self.createdAt = createdAt
    }
}
