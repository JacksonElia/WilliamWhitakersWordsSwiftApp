//
//  SearchViewController.swift
//  WilliamWhitakersWords 2
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
