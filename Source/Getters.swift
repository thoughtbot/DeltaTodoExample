import ReactiveCocoa

extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }

    var completedTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { $0.completed }
        }
    }

    var incompleteTodos: SignalProducer<[Todo], NoError> {
        return todos.producer.map { todos in
            return todos.filter { !$0.completed }
        }
    }

    var incompleteTodosCount: SignalProducer<Int, NoError> {
        return incompleteTodos.map { $0.count }
    }

    var allTodosCount: SignalProducer<Int, NoError> {
        return todos.producer.map { $0.count }
    }

    var todoStats: SignalProducer<(Int, Int), NoError> {
        return allTodosCount.zipWith(incompleteTodosCount)
    }

    func producerForTodo(todo: Todo) -> SignalProducer<Todo, NoError> {
        return store.todos.producer.map { todos in
            return todos.filter { $0 == todo }.first
        }.ignoreNil()
    }
}
