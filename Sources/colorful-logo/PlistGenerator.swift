//
//  PlistGenerator.swift
//  colorful-logo
//
//  Created by Karainon on 2019/2/16.
//

import Foundation


class PlistGenerator {
    
    var iconNames: Set<String> = Set<String>()
    
    var generated: String {
        return "\(iphone())\n\(ipad())"
    }
    
    func iphone() -> String {
        var items = [String]()
        iconNames.forEach { name in
            items.append(iconIphoneTemplate.replacingOccurrences(of: "${icon_name}", with: name))
        }
        let iphoneTemplate = BUNDLE_ICON_TEMPLATE.replacingOccurrences(of: "${ipad}", with: "")
        
        return iphoneTemplate.replacingOccurrences(of: "${item}", with: items.joined(separator: "\n"))
    }
    
    func ipad() -> String {
        var items = [String]()
        iconNames.forEach { name in
            items.append(iconIpadTemplate.replacingOccurrences(of: "${icon_name}", with: name))
        }
        let ipadTemplate = BUNDLE_ICON_TEMPLATE.replacingOccurrences(of: "${ipad}", with: "~ipad")
        
        return ipadTemplate.replacingOccurrences(of: "${item}", with: items.joined(separator: "\n"))
    }
}

fileprivate let iconIphoneTemplate =
"""
    <key>${icon_name}</key>
    <dict>
        <key>CFBundleIconFiles</key>
            <array>
                <string>${icon_name}-iphone</string>
            </array>
        <key>UIPrerenderedIcon</key>
        <false/>
    </dict>
"""

fileprivate let iconIpadTemplate =
"""
    <key>${icon_name}</key>
    <dict>
        <key>CFBundleIconFiles</key>
            <array>
                <string>${icon_name}-ipadpro</string>
                <string>${icon_name}-ipad</string>
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
        </dict>
"""

