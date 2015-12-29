import UIKit

class FooterView: UIView {
    var stackView: UIStackView? {
        return self.subviews.first as? UIStackView
    }

    var itemsLeftLabel: UILabel? {
        return stackView?.subviews.first as? UILabel
    }

    override func awakeFromNib() {
        store.incompleteTodos.startWithNext { todos in
            let count = todos.count

            if count == 1 {
                self.itemsLeftLabel?.text = "1 todo left"
            } else {
                self.itemsLeftLabel?.text = "\(count) todos left"
            }
        }
    }
}
