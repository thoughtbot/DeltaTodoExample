import UIKit
import ReactiveCocoa

class TodoTableViewCell: UITableViewCell {
    var todo: Todo? {
        didSet {
            updateUI()
        }
    }

    var attributedText: NSAttributedString {
        guard let todo = todo else { return NSAttributedString() }

        let attributes: [String : AnyObject]
        if todo.completed {
            attributes = [NSStrikethroughStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        } else {
            attributes = [:]
        }

        return NSAttributedString(string: todo.name, attributes: attributes)
    }

    func configure(todo: Todo) {
        store.producerForTodo(todo).startWithNext { nextTodo in
            self.todo = nextTodo
        }
    }

    func updateUI() {
        guard let todo = todo else { return }

        textLabel?.attributedText = attributedText
        accessoryType = todo.completed ? .Checkmark : .None
    }
}
