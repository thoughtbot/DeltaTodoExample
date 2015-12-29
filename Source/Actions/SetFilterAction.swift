import Delta

struct SetFilterAction: ActionType {
    let filter: TodoFilter

    func reduce(state: AppState) -> AppState {
        state.filter.value = filter
        return state
    }
}
