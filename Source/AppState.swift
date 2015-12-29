import ReactiveCocoa

private let initialTodos = [
    Todo(name: "Have tea with the Queen", completed: true),
    Todo(name: "Circumnavigate the globe", completed: false),
    Todo(name: "Race a cheetah", completed: false),
    Todo(name: "Climb Mount Everest", completed: true),
    Todo(name: "Jump out of a plane", completed: false),
    Todo(name: "Read a book", completed: false),
]

struct AppState {
    let todos = MutableProperty(initialTodos)
    let filter = MutableProperty(TodoFilter.All)
}
