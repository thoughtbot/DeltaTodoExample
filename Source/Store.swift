import ReactiveCocoa
import Delta

struct Store: StoreType {
    var state: MutableProperty<AppState>

    init(state: AppState) {
        self.state = MutableProperty(state)
    }
}

var store = Store(state: AppState())
