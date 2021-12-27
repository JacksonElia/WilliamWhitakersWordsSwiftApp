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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hyperlinkTextView(textView: githubTextView, subText: "Github", link: "https://github.com/Traptricker")
        hyperlinkTextView(textView: wwwTextView, subText: "William Whitaker's Words", link: "https://archives.nd.edu/words.html")
    }
    
    func hyperlinkTextView(textView: UITextView, subText: String, link: String) {
        // Makes an special string object that can be edited in special ways
        let attributedString = NSMutableAttributedString(string: textView.text)
        // Gets the range of the subtext in the terms of an NSString
        let subtextRange = NSString(string: textView.text).range(of: subText)
        attributedString.addAttribute(.link, value: link, range: subtextRange)
        let font = textView.font
        textView.attributedText = attributedString
        textView.font = font
        textView.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.link]
        textView.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textView.textAlignment = .center
    }
}
