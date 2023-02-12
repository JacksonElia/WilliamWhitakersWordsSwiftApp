//
//  InfoViewController.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/27/21.
//

import UIKit

class InfoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var githubTextView: UITextView!
    @IBOutlet weak var wwwTextView: UITextView!
    
    var nightmodeOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hyperlinks the part of the textviews specified
        hyperlinkTextView(textView: githubTextView, subText: "website", link: "https://jacksonelia.github.io/")
        hyperlinkTextView(textView: wwwTextView, subText: "William Whitaker's Words", link: "https://archives.nd.edu/words.html")
        // Turns nightmode on or off based on what the user selected
        if nightmodeOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    func hyperlinkTextView(textView: UITextView, subText: String, link: String) {
        // Makes an special string object that can be edited in special ways
        let attributedString = NSMutableAttributedString(string: textView.text)
        // Gets the range of the subtext in the terms of an NSString
        let subtextRange = NSString(string: textView.text).range(of: subText)
        attributedString.addAttribute(.link, value: link, range: subtextRange)
        let font = textView.font
        let textColor = textView.textColor
        textView.attributedText = attributedString
        textView.font = font
        textView.textColor = textColor
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.link]
        textView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.textAlignment = .center
    }
    
}
