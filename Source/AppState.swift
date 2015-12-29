import ReactiveCocoa

struct AppState {
    let todos = MutableProperty<[Todo]>([])
}
