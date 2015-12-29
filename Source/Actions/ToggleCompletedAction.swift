import Delta

struct ToggleCompletedAction: ActionType {
    let todo: Todo

    func reduce(state: AppState) -> AppState {
        state.todos.value = state.todos.value.map { todo in
            guard todo == self.todo else { return todo }

            return Todo(name: todo.name, completed: !todo.completed)
        }

        return state
    }
}
