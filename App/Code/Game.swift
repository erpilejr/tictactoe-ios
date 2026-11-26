enum Mark: String {
    case x = "X"
    case o = "O"

    var other: Mark { self == .x ? .o : .x }
}

struct Game {
    var squares: [Mark?] = Array(repeating: nil, count: 9)
    var current: Mark = .x

    var turnText: String { "\(current.rawValue)'s turn" }

    mutating func play(_ index: Int) {
        guard squares.indices.contains(index), squares[index] == nil else { return }
        squares[index] = current
        current = current.other
    }
}
