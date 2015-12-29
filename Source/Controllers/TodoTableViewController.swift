import UIKit

class TodoTableViewController: UITableViewController {
    var viewModel = TodosViewModel(todos: []) {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        store.todos.producer.startWithNext { todos in
            self.viewModel = TodosViewModel(todos: todos)
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as! TodoTableViewCell
        let todo = viewModel.todoForIndexPath(indexPath)

        cell.configure(todo)

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = viewModel.todoForIndexPath(indexPath)
        store.dispatch(ToggleCompletedAction(todo: todo))
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    @IBAction func addTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create", message: "Create a new todo item", preferredStyle: .Alert)

        alertController.addTextFieldWithConfigurationHandler() { textField in
            textField.placeholder = "Name"
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { _ in })
        alertController.addAction(UIAlertAction(title: "Create", style: .Default) { _ in
            guard let name = alertController.textFields?.first?.text else { return }

            store.dispatch(CreateTodoAction(name: name))
        })

        presentViewController(alertController, animated: false, completion: nil)
    }
}
