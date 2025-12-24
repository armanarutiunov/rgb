import ArgumentParser
import CoreGraphics

@main
struct RGB: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "An RGB converter tool. Use it to convert RGB(A) to hex and vica versa.",
        subcommands: [ToHex.self]
    )
}

struct ToHex: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Parse an RGB value to hex")

    @Argument(help: "Red")
    var r: Float

    @Argument(help: "Green")
    var g: Float

    @Argument(help: "Blue")
    var b: Float

    @Option(name: .short, help: "Alpha")
    var a: Float = 1

    func run() {
        func clamp01(_ x: CGFloat) -> CGFloat {
            min(max(x, 0), 255)
        }
        let r8 = Int(round(clamp01(CGFloat(r))))
        let g8 = Int(round(clamp01(CGFloat(g))))
        let b8 = Int(round(clamp01(CGFloat(b))))
        let a8 = Int(round(clamp01(CGFloat(a))))
        print(String(format: "#%02X%02X%02X%02X", r8, g8, b8, a8))
    }
}
