import ReactiveCocoa

extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }

    var incompleteTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { !$0.completed }
        }
    }

    func producerForTodo(todo: Todo) -> SignalProducer<Todo, NoError> {
        return store.todos.producer.map { todos in
            return todos.filter { $0 == todo }.first
        }.ignoreNil()
    }
}
