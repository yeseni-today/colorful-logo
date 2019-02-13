//
//  Extensions.swift
//  colorful-logo
//
//  Created by Karainon on 2019/2/13.
//

import Foundation
import AppKit

extension NSBitmapImageRep {
    
    var png: Data? {
        return representation(using: .png, properties: [:])
    }
    
}

extension Data {
    
    var bitmap: NSBitmapImageRep? {
        return NSBitmapImageRep(data: self)
    }
    
}

extension NSImage {
    
    var png: Data? {
        return tiffRepresentation?.bitmap?.png
    }
    
    func savePNG(to url: URL) -> Bool {
        do {
            try png?.write(to: url)
            return true
        } catch {
            print(error)
            return false
        }
    }
}
