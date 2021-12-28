//
//  SearchViewController.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/11/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    
    var searchLabelText = ""
    var nightmodeOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchLabel.text = searchLabelText
        if nightmodeOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }

}
