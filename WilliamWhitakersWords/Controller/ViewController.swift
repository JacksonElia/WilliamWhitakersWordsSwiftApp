//
//  ViewController.swift
//  William Whitaker's Words Swift App
//
//  Created by Jack Elia on 11/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var latinButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var latinTextField: UITextField!
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nightmodeButton: UIBarButtonItem!
    
    var contents = ""
    var search = ""
    var searchType = ""
    var nightmodeOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        latinTextField.autocorrectionType = .no
        latinButton.layer.cornerRadius = 5
        englishButton.layer.cornerRadius = 5
        nightmodeOn = traitCollection.userInterfaceStyle == .dark
        // Turns nightmode on or off based on what the user selected
        if nightmodeOn {
            nightmodeButton.image = UIImage(systemName: "moon.fill")
            self.navigationController?.navigationBar.tintColor = UIColor.white
        } else {
            nightmodeButton.image = UIImage(systemName: "moon")
            self.navigationController?.navigationBar.tintColor = UIColor.black
        }
    }
    
    @IBAction func latinButtonPressed(_ sender: UIButton) {
        // Puts the keyboard away
        view.endEditing(true)
        messageLabel.text = ""

        if latinTextField.text != "" {
            search = latinTextField.text!
            contents = SearchBrain.getHTML(search: search, type: "latin")
            searchType = "latin"
            performSegue(withIdentifier: "searchSegue", sender: self)
        } else {
            messageLabel.text = "Type Something!"
        }
    }
    
    @IBAction func englishButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        messageLabel.text = ""

        if englishTextField.text != "" {
            search = englishTextField.text!
            contents = SearchBrain.getHTML(search: search, type: "english")
            searchType = "english"
            performSegue(withIdentifier: "searchSegue", sender: self)
        } else {
            messageLabel.text = "Type Something!"
        }
    }
    
    // Changes the nightmode button's appearance and the interface's appearance to light or dark
    var buttonPressed = false
    @IBAction func nightmodeButtonPressed(_ sender: UIBarButtonItem) {
        nightmodeOn = !nightmodeOn
        if nightmodeOn {
            nightmodeButton.image = UIImage(systemName: "moon.fill")
            overrideUserInterfaceStyle = .dark
            self.navigationController?.navigationBar.tintColor = UIColor.white
        } else {
            nightmodeButton.image = UIImage(systemName: "moon")
            overrideUserInterfaceStyle = .light
            self.navigationController?.navigationBar.tintColor = UIColor.black
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            let destinationVC = segue.destination as! SearchViewController
            destinationVC.searchLabelText = contents
            destinationVC.search = search
            destinationVC.searchType = searchType
            destinationVC.nightmodeOn = nightmodeOn
        } else if segue.identifier == "infoSegue" {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.nightmodeOn = nightmodeOn
        } else if segue.identifier == "favoritesSegue" {
            let destinationVC = segue.destination as! FavoritesViewController
            destinationVC.nightmodeOn = nightmodeOn
        }
    }
    
}

extension UIViewController {
    // Puts the keyboard away if the user taps outside of the textbox
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
