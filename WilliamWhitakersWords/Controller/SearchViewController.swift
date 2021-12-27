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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchLabel.text = searchLabelText
        
    }

}
