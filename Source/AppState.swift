import ReactiveCocoa

struct AppState {
    let todos = MutableProperty([
        Todo(name: "Create example app", completed: true),
        Todo(name: "Celebrate", completed: false),
    ])
}
