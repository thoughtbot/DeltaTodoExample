import ReactiveCocoa

extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }
}
