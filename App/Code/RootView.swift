import SwiftUI

struct RootView: View {
    @State private var game = Game()

    var body: some View {
        VStack(spacing: 16) {
            Text(game.turnText)
                .font(.title)
                .accessibilityIdentifier("turn")
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { col in
                        square(row * 3 + col)
                    }
                }
            }
            Button("Restart") {
                game = Game()
            }
            .accessibilityIdentifier("restart-button")
        }
        .padding()
    }

    private func square(_ index: Int) -> some View {
        Button {
            game.play(index)
        } label: {
            Text(game.squares[index]?.rawValue ?? "")
                .font(.largeTitle)
                .frame(width: 90, height: 90)
                .background(Color.gray.opacity(0.2))
        }
        .buttonStyle(.plain)
        .accessibilityIdentifier("square-\(index)")
    }
}
