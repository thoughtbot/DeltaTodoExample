import Foundation

struct TodosViewModel {
    let todos = store.todos.value

    func todoForIndexPath(indexPath: NSIndexPath) -> Todo {
        return todos[indexPath.row]
    }
}
