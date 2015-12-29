import Delta

struct CreateTodoAction: ActionType {
    let name: String

    var newTodo: Todo {
        return Todo(name: name, completed: false)
    }

    func reduce(state: AppState) -> AppState {
        state.todos.value = state.todos.value + [newTodo]

        return state
    }
}
