enum Mark: String {
    case x = "X"
    case o = "O"

    var other: Mark { self == .x ? .o : .x }
}

struct Game {
    var squares: [Mark?] = Array(repeating: nil, count: 9)
    var current: Mark = .x

    var winner: Mark?

    var isDraw: Bool { winner == nil && !squares.contains { $0 == nil } }

    var turnText: String {
        if let winner { return "\(winner.rawValue) wins!" }
        if isDraw { return "It's a draw!" }
        return "\(current.rawValue)'s turn"
    }

    private static let lines = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    mutating func play(_ index: Int) {
        guard winner == nil, squares.indices.contains(index), squares[index] == nil else { return }
        squares[index] = current
        if Game.lines.contains(where: { line in line.allSatisfy { squares[$0] == current } }) {
            winner = current
            return
        }
        current = current.other
    }
}
