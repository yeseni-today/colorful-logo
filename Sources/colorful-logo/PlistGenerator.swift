//
//  PlistGenerator.swift
//  colorful-logo
//
//  Created by Karainon on 2019/2/16.
//

import Foundation


class PlistGenerator {
    
    var iconNames: Set<String> =  Set<String>()
    
    var generated: String {
        var items = [String]()
        iconNames.forEach { name in
            items.append(ITEM_TEMPLATE.replacingOccurrences(of: "${icon_name}", with: name))
        }
        let itemsJoined = items.joined(separator: "\n")
        
        let iphone = BUNDLE_ICON_TEMPLATE.replacingOccurrences(of: "${ipad}", with: "")
        let ipad = BUNDLE_ICON_TEMPLATE.replacingOccurrences(of: "${ipad}", with: "~ipad")
        
        let iphoneJoined = iphone.replacingOccurrences(of: "${item}", with: itemsJoined)
        let ipadJoined = ipad.replacingOccurrences(of: "${item}", with: itemsJoined)
        
        return "\(iphoneJoined)\n\(ipadJoined)"
    }
    
}

fileprivate let ITEM_TEMPLATE =
"""
    <key>${icon_name}</key>
        <dict>
            <key>CFBundleIconFiles</key>
                <array>
                    <string>${icon_name}</string>
                </array>
            <key>UIPrerenderedIcon</key>
                <false/>
        </dict>
"""

fileprivate let BUNDLE_ICON_TEMPLATE =
"""
    <key>CFBundleIcons${ipad}</key>
        <dict>
            <key>CFBundleAlternateIcons</key>
            <dict>
                ${item}
            </dict>

            <key>UINewsstandIcon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                        <array>
                            <string></string>
                        </array>
                    <key>UINewsstandBindingEdge</key>
                        <string>UINewsstandBindingEdgeLeft</string>
                    <key>UINewsstandBindingType</key>
                        <string>UINewsstandBindingTypeMagazine</string>
                </dict>
        </dict>
"""

