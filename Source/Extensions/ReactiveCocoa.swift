import ReactiveCocoa
import Delta

extension MutableProperty: Delta.ObservablePropertyType {
    public typealias ValueType = Value
}
