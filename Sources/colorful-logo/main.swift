import AppKit
import Foundation

let ITEM_SIZE = CGSize(width: 1024, height: 1024)
let LOGO_PATH = "/Users/Karainon/Desktop/logo.png"

let image = NSImage(contentsOf: URL(fileURLWithPath: "/Users/Karainon/Desktop/logo.png"))!
image.backgroundColor = NSColor.red
let imageView = ImageView(image: image)
imageView.frame.size = ITEM_SIZE
imageView.backgroundColor = NSColor.red
imageView.needsDisplay = true
imageView.needsLayout = true

let target = NSImage(data: imageView.dataWithPDF(inside: imageView.bounds))!
target.savePNG(to: URL(fileURLWithPath: "/Users/Karainon/Desktop/a/target.png"))
print("Hello, world! AppKit")
