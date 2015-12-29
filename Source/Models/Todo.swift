struct Todo {
    let name: String
    let completed: Bool
}

extension Todo: Equatable { }

func == (lhs: Todo, rhs: Todo) -> Bool {
    return lhs.name == rhs.name && lhs.completed == rhs.completed
}
