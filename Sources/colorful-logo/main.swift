import AppKit
import Foundation

let colors = [
//    ("flatYellow", Color.flatYellow),
    ("flatWhite", Color.flatWhite),
//    ("flatWatermelon", Color.flatWatermelon),
//    ("flatTeal", Color.flatTeal),
//    ("flatSkyBlue", Color.flatSkyBlue),
//    ("flatSand", Color.flatSand),
//    ("flatRed", Color.flatRed),
//    ("flatPurple", Color.flatPurple),
//    ("flatPowderBlue", Color.flatPowderBlue),
//    ("flatPlum", Color.flatPlum),
//    ("flatPink", Color.flatPink),
//    ("flatOrange", Color.flatOrange),
//    ("flatNavyBlue", Color.flatNavyBlue),
    ("flatMint", Color.flatMint),
//
//    ("flatMaroon", Color.flatMaroon),
//    ("flatMagenta", Color.flatMagenta),
//    ("flatLime", Color.flatLime),
//    ("flatGreen", Color.flatGreen),
//    ("flatGray", Color.flatGray),
//    ("flatForestGreen", Color.flatForestGreen),
//    ("flatCoffee", Color.flatCoffee),
//
//    ("flatBrown", Color.flatBrown),
//    ("flatBlue", Color.flatBlue),
//    ("flatForestGreen", Color.flatForestGreen),
//    ("flatBlack", Color.flatBlack),
    
]

let ITEM_SIZE = CGSize(width: 1024, height: 1024)
let LOGO_PATH = URL(fileURLWithPath: "/Users/Karainon/Desktop/logo.png")

let baseDir = URL(fileURLWithPath: "/Users/Karainon/Desktop/a")

enum OuputType {
    case iphone2x, iphone3x, ipad2x, ipad3x
    
    var size: CGSize {
        switch self {
        case .iphone2x, .ipad2x: return CGSize(width: 120, height: 120)
        case .iphone3x, .ipad3x: return CGSize(width: 160, height: 160)
        }
    }
    
    var suffix: String {
        switch self {
        case .iphone2x, .ipad2x: return "@2x"
        case .iphone3x, .ipad3x: return "@3x"
        }
    }
}
    
    
func process(logo: URL, outputDir: URL, type: OuputType) {
    let generator = IconGenerator(path: logo, size: type.size)
    let suffix = type.suffix
    for (name, color) in colors {
        generator.save(to: outputDir.appendingPathComponent("\(name)-1\(suffix).png"), tint: color, background: .flatWhite)
        generator.save(to: outputDir.appendingPathComponent("\(name)-2\(suffix).png"), tint: .flatWhite, background: color)
        generator.save(to: outputDir.appendingPathComponent("\(name)-3\(suffix).png"), tint: color, background: .flatBlack)
        generator.save(to: outputDir.appendingPathComponent("\(name)-4\(suffix).png"), tint: .flatBlack, background: color)
    }
}

process(logo: LOGO_PATH, outputDir: baseDir, type: .iphone2x)
process(logo: LOGO_PATH, outputDir: baseDir, type: .iphone3x)

let plistGenerator = PlistGenerator()
for (name, _) in colors {
    (1...4).forEach { (i) in
        plistGenerator.iconNames.insert("\(name)-\(i)")
    }
}
print(plistGenerator.generated)



