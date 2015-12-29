import UIKit

class FooterView: UIView {
    var stackView: UIStackView? {
        return self.subviews.first as? UIStackView
    }

    var itemsLeftLabel: UILabel? {
        return stackView?.subviews.first as? UILabel
    }

    var clearCompletedButton: UIButton? {
        return stackView?.subviews.last as? UIButton
    }

    override func awakeFromNib() {
        self.clearCompletedButton?.addTarget(self, action: "clearCompletedTapped", forControlEvents: .TouchUpInside)
        self.subscribeToStoreChanges()
    }

    func subscribeToStoreChanges() {
        store.todoStats.startWithNext { todosCount, incompleteCount in
            self.clearCompletedButton?.hidden = todosCount == incompleteCount

            if incompleteCount == 1 {
                self.itemsLeftLabel?.text = "1 todo left"
            } else {
                self.itemsLeftLabel?.text = "\(incompleteCount) todos left"
            }
        }
    }

    func clearCompletedTapped() {
        store.dispatch(ClearCompletedTodosAction())
    }
}
