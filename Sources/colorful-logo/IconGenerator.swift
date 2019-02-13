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
    
    lazy var view: ImageView = {
        $0.frame.size = self.size
        return $0
    }(ImageView(image: image))
    
    init(path: URL, size: CGSize) {
        self.image = NSImage(contentsOf: path)!
        self.size = size
    }
    
    func save(to url: URL, color: NSColor) {
        view.backgroundColor = color
        view.needsDisplay = true
        view.needsLayout = true
        let recolor = NSImage(data: view.dataWithPDF(inside: view.bounds))
        recolor?.savePNG(to: url)
    }
    
}
