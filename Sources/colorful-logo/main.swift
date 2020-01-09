import AppKit
import Foundation

enum RenderMode: Int {
    case tintForegroundWhiteBackground = 1
    case whiteForegoundTintBackground = 2
    case tintForegorundBlackBackgroud = 3
    case blackForegroundTintBackground = 4

    static var all: [RenderMode] = [
        .tintForegroundWhiteBackground,
        .whiteForegoundTintBackground,
        .tintForegorundBlackBackgroud,
        .blackForegroundTintBackground
    ]

    static let one = RenderMode(rawValue: 1)!
    static let two = RenderMode(rawValue: 2)!
    static let three = RenderMode(rawValue: 3)!
    static let four = RenderMode(rawValue: 4)!
    
    func color(_ tint: Color) -> (Color, Color) {
        switch self {
        case .tintForegorundBlackBackgroud:
            if tint == Color.flatWhite {
                return (Color.white, Color.black)
            }
            return (tint, .black)
        case .tintForegroundWhiteBackground: return (tint, .flatWhite)
        case .whiteForegoundTintBackground: return (.flatWhite, tint)
        case .blackForegroundTintBackground: return (.flatBlack, tint)
        }
    }
}

struct Style {
    var tintColor: Color
    var mode: [RenderMode]
    var name: String
    
    init(_ name: String, _ tintColor: Color, mode: [RenderMode] = RenderMode.all) {
        self.name = name
        self.tintColor = tintColor
        self.mode = mode
    }
}

var styles: [Style] = [
    Style("pink", .flatPink),
    Style("red", .flatRed),
    Style("watermelon", .flatWatermelon),
    Style("sand", .flatSand, mode: [.three, .four]),
    Style("orange", .flatOrange),
    Style("yellow", .flatYellow, mode: [.three, .four]),
    
    Style("lime", .flatLime),
    Style("green", .flatGreen),
    Style("mint", .flatMint),
    Style("forestGreen", .flatForestGreen, mode: [.one, .two]),
    
    Style("powderblue", .flatPowderBlue, mode: [.three, .four]),
    Style("skyblue", .flatSkyBlue),
    Style("blue", .flatBlue, mode: [.one, .two, .three, .four]),
    Style("navyblue", .flatNavyBlue, mode: [.one, .two]),
    
    Style("purple", .flatPurple),
    Style("magenta", .flatMagenta),
    
    Style("plum", .flatPlum, mode: [.one, .two]),
    Style("maroon", .flatMaroon, mode: [.one, .two]),
    
    Style("coffee", .flatCoffee),
    Style("teal", .flatTeal),
    
    Style("gray", .flatGray, mode: [.four]),
    
    Style("white", .flatWhite, mode: [.three, .four]),
    Style("black", .flatBlack, mode: [.one, .two]),
    ]

enum OutputType: CGFloat {
    /// refer https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon/
    case s120 = 120
    case s180 = 180
    case s167 = 167
    case s152 = 152
    
    var size: CGSize {
        CGSize(width: rawValue, height: rawValue)
    }
    
    var nameSuffix: String {
        switch self {
        case .s120: return "-iphone"
        case .s180: return "-iphone"
        case .s167: return "-ipadpro"
        case .s152: return "-ipad"
        }
    }
    var suffix: String {
        switch self {
        case .s120: return "-iphone@2x"
        case .s180: return "-iphone@3x"
        case .s167: return "-ipadpro@2x"
        case .s152: return "-ipad@2x"
        }
    }
    
    static let alternativeIconSize: [OutputType] = [.s120, .s180, .s167, .s152]
}
    
    
func process(logo: URL, outputDir: URL) {
    if !FileManager.default.fileExists(atPath: outputDir.path) {
        try! FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true, attributes: nil)
    }
    
    let generators = OutputType.alternativeIconSize.map { IconGenerator(path: logo, type: $0) }
    for style in styles {
        for mode in style.mode {
            let colors = mode.color(style.tintColor)
            generators.forEach {
                let output = outputDir.appendingPathComponent("\(style.name)-\(mode.rawValue)\($0.type.suffix).png")
                $0.save(to: output, tint: colors.0, background: colors.1)
            }
        }
  
    }
}

let logo = URL(fileURLWithPath: "/Users/today/Library/Mobile Documents/com~apple~CloudDocs/Mematom/Logos/logo.png")
let output = URL(fileURLWithPath: "/Users/today/Desktop/Icons")

//process(logo: logo, outputDir: output)


func largeLogo() {
    let generator = IconGenerator(path: logo, size: CGSize(width: 1024, height: 1024))
    let out = URL(fileURLWithPath: "/Users/today/Desktop/Logo")
    generator.save(to: out, tint: .flatGreen, background: .black)
}

    largeLogo()

//
//let plistGenerator = PlistGenerator()
//for style in styles {
//    for mode in style.mode {
//        plistGenerator.iconNames.insert("\(style.name)-\(mode.rawValue)")
//    }
//}
//print(plistGenerator.generated)



