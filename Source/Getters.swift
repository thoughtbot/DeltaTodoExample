import ReactiveCocoa

extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }

    func producerForTodo(todo: Todo) -> SignalProducer<Todo, NoError> {
        return store.todos.producer.map { todos in
            return todos.filter { $0 == todo }.first
        }.ignoreNil()
    }
}
