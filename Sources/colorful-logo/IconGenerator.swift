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
    
    @available(OSX 10.12, *)
    lazy var _view: ImageView = {
        $0.frame.size = self.size
        return $0
    }(ImageView(image: image))
    
    var view: ImageView {
        if #available(OSX 10.12, *) {
            return _view
        } else {
            return ImageView()
        }
    }
    
    init(path: URL, type: OutputType) {
        self.image = NSImage(contentsOf: path)!
        self.type = type
        self.size = type.size
    }
    
    init(path: URL, size: CGSize) {
        self.image = NSImage(contentsOf: path)!
        self.type = .s120
        self.size = size
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
