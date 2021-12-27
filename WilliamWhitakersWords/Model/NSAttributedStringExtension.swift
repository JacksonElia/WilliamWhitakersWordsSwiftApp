//
//  NSAttributedStringExtension.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/27/21.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    static func hyperLink(link: String, text: String, subText: String) -> NSAttributedString {
        // Centers the text
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = .center
        // The whole string
        let nsString = NSString(string: text)
        // The link
        let subtextRange = nsString.range(of: subText)
        
        let attributedString = NSMutableAttributedString(string: text, attributes: [.paragraphStyle: titleParagraphStyle])
        attributedString.addAttribute(.link, value: link, range: subtextRange)
        return attributedString
    }
    
}
