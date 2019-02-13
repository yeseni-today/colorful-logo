import AppKit
import Foundation

let ITEM_SIZE = CGSize(width: 1024, height: 1024)
let LOGO_PATH = URL(fileURLWithPath: "/Users/Karainon/Desktop/logo.png")

let TARGET_PATH = URL(fileURLWithPath: "/Users/Karainon/Desktop/a/target.png")

let generator = IconGenerator(path: LOGO_PATH, size: ITEM_SIZE)
generator.save(to: TARGET_PATH, color: .green)
