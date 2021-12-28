//
//  SearchViewController.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/11/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    let userDefaults = UserDefaults.standard
    var search = ""
    var searchLabelText = ""
    var searchType = ""
    var nightmodeOn = false
    var searchFavorited = false
    var favoritesDict = [String:[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Gets the favorites dictionary from userdefaults
        favoritesDict = userDefaults.object(forKey: "favoritesDict") as? Dictionary<String, [String:String]> ?? [String:[String:String]]()
        
        // Checks to see if search is favorited, won't let the user favorite the same search in both latin and english
        searchFavorited = favoritesDict.keys.contains(search) && favoritesDict[search]?["type"] == searchType
        // Sets the favorite button as filled or not based on if the search was starred
        if searchFavorited {
            favoriteButton.image = UIImage(systemName: "star.fill")
        } else {
            favoriteButton.image = UIImage(systemName: "star")
        }
        
        searchLabel.text = searchLabelText
        // Turns nightmode on or off based on what the user selected
        if nightmodeOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }

    }

    // Changes appearance of favorite button and saves favorited search to user defaults
    @IBAction func favoriteButtonPressed(_ sender: UIBarButtonItem) {
        searchFavorited = !searchFavorited
        if searchFavorited {
            favoriteButton.image = UIImage(systemName: "star.fill")
            favoritesDict[search] = ["type":searchType, "date":getTime()]
            userDefaults.set(favoritesDict, forKey: "favoritesDict")
        } else {
            favoriteButton.image = UIImage(systemName: "star")
            favoritesDict.removeValue(forKey: search)
            userDefaults.set(favoritesDict, forKey: "favoritesDict")
        }
    }
    
    // Gets the current date and time and returns it as a string
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        
        return formatter.string(from: Date())
    }
    
}
