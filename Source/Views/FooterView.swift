import UIKit

class FooterView: UIView {
    var stackView: UIStackView? {
        return self.subviews.first as? UIStackView
    }

    var itemsLeftLabel: UILabel? {
        return stackView?.subviews.first as? UILabel
    }

    override func awakeFromNib() {
        self.subscribeToStoreChanges()
    }

    func subscribeToStoreChanges() {
        store.todoStats.startWithNext { todosCount, incompleteCount in

            if incompleteCount == 1 {
                self.itemsLeftLabel?.text = "1 todo left"
            } else {
                self.itemsLeftLabel?.text = "\(incompleteCount) todos left"
            }
        }
    }
}
