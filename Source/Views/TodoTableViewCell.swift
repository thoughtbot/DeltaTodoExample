import UIKit

class TodoTableViewCell: UITableViewCell {
    func configureWithTodo(todo: Todo) {
        textLabel?.text = todo.name
        accessoryType = todo.completed ? .Checkmark : .None
    }
}
