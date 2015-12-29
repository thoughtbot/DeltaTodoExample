import ReactiveCocoa

// MARK: Properties
extension Store {
    var todos: MutableProperty<[Todo]> {
        return state.value.todos
    }

    var activeFilter: MutableProperty<TodoFilter> {
        return state.value.filter
    }
}

// MARK: SignalProducers
extension Store {
    var activeTodos: SignalProducer<[Todo], NoError> {
        return activeFilter.producer.flatMap(.Latest) { filter -> SignalProducer<[Todo], NoError> in
            switch filter {
            case .All: return self.todos.producer
            case .Active: return self.incompleteTodos
            case .Completed: return self.completedTodos
            }
        }
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
