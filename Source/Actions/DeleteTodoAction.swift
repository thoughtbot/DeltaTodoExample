import Delta

struct DeleteTodoAction: ActionType {
    let todo: Todo

    func reduce(state: AppState) -> AppState {
        state.todos.value = state.todos.value.filter { $0 != self.todo }

        return state
    }
}
