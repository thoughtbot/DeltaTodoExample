import Foundation
import ReactiveCocoa

struct TodosViewModel {
    let todos: [Todo]

    func todoForIndexPath(indexPath: NSIndexPath) -> Todo {
        return todos[indexPath.row]
    }
}
