//
//  IconGenerator.swift
//  colorful-logo
//
//  Created by Karainon on 2019/2/13.
//
import AppKit

class IconGenerator {
    
    var image: NSImage
    
    var size: CGSize
    
    var type: OutputType
    
    lazy var view: ImageView = {
        $0.frame.size = self.size
        return $0
    }(ImageView(image: image))
    
    init(path: URL, type: OutputType) {
        self.image = NSImage(contentsOf: path)!
        self.type = type
        self.size = type.size
    }
    
    func save(to url: URL, tint: NSColor, background: NSColor) {
        view.image = image.tint(tint)
        view.backgroundColor = background
        view.needsDisplay = true
        view.needsLayout = true
        let recolor = NSImage(data: view.dataWithPDF(inside: view.bounds))
        recolor?.savePNG(to: url)
    }
    
    func save(to url: URL) {
        let recolor = NSImage(data: view.dataWithPDF(inside: view.bounds))
        recolor?.savePNG(to: url)
    }
    
}
