//
//  FavoritesViewController.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/27/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    var nightmodeOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if nightmodeOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }

}
