import AppKit
import Foundation

let ITEM_SIZE = CGSize(width: 1024, height: 1024)
let LOGO_PATH = URL(fileURLWithPath: "/Users/Karainon/Desktop/logo.png")

let TARGET_PATH = URL(fileURLWithPath: "/Users/Karainon/Desktop/a/target.png")

let baseDir = URL(fileURLWithPath: "/Users/Karainon/Desktop/a")

let generator = IconGenerator(path: LOGO_PATH, size: ITEM_SIZE)


let colors = [
    ("flatYellow", Color.flatYellow),
    ("flatWhite", Color.flatWhite),
    ("flatWatermelon", Color.flatWatermelon),
    ("flatTeal", Color.flatTeal),
    ("flatSkyBlue", Color.flatSkyBlue),
    ("flatSand", Color.flatSand),
    ("flatRed", Color.flatRed),
    ("flatPurple", Color.flatPurple),
    ("flatPowderBlue", Color.flatPowderBlue),
    ("flatPlum", Color.flatPlum),
    ("flatPink", Color.flatPink),
    ("flatOrange", Color.flatOrange),
    ("flatNavyBlue", Color.flatNavyBlue),
    ("flatMint", Color.flatMint),
    
    ("flatMaroon", Color.flatMaroon),
    ("flatMagenta", Color.flatMagenta),
    ("flatLime", Color.flatLime),
    ("flatGreen", Color.flatGreen),
    ("flatGray", Color.flatGray),
    ("flatForestGreen", Color.flatForestGreen),
    ("flatCoffee", Color.flatCoffee),
    
    ("flatBrown", Color.flatBrown),
    ("flatBlue", Color.flatBlue),
    ("flatForestGreen", Color.flatForestGreen),
    ("flatBlack", Color.flatBlack),
    
]

func process() {
    for (name, color) in colors {
        generator.save(to: baseDir.appendingPathComponent("\(name)-1.png"), tint: color, background: .flatBlack)
        generator.save(to: baseDir.appendingPathComponent("\(name)-2.png"), tint: color, background: .flatWhite)
        generator.save(to: baseDir.appendingPathComponent("\(name)-3.png"), tint: .flatBlack, background: color)
        generator.save(to: baseDir.appendingPathComponent("\(name)-4.png"), tint: .flatWhite, background: color)
    }
}

process()
