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
    
    var contents: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        latinTextField.autocorrectionType = .no
        latinButton.layer.cornerRadius = 5
        englishButton.layer.cornerRadius = 5
    }
    
    @IBAction func latinButtonPressed(_ sender: UIButton) {
        // Puts the keyboard away
        view.endEditing(true)
        messageLabel.text = ""

        if latinTextField.text != "" {
            contents = SearchBrain.getHTML(search: latinTextField.text!, type: "latin")
            print(contents)
            performSegue(withIdentifier: "searchSegue", sender: self)
        } else {
            messageLabel.text = "Type Something!"
        }
    }
    
    @IBAction func englishButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        messageLabel.text = ""

        if englishTextField.text != "" {
            contents = SearchBrain.getHTML(search: englishTextField.text!, type: "english")
            print(contents)
            performSegue(withIdentifier: "searchSegue", sender: self)
        } else {
            messageLabel.text = "Type Something!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            let destinationVC = segue.destination as! SearchViewController
            destinationVC.searchLabelText = contents
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
