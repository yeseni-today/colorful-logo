//
//  View.swift
//  colorful-logo
//
//  Created by Karainon on 2019/2/13.
//

import AppKit

class ImageView: NSImageView {
    
    var backgroundColor: NSColor?
    
    override func draw(_ dirtyRect: NSRect) {
        
        if let color = self.backgroundColor {
            color.setFill()
            dirtyRect.fill()
        }
        super.draw(dirtyRect)
    }
    
}
