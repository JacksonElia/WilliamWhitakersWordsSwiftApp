//
//  FavoritesViewController.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/27/21.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    let userDefaults = UserDefaults.standard
    var nightmodeOn = false
    var favoritesDict = [String:[String:String]]()
    var favoritesDictArray = [String]()
    var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        // Gets the favorites dict from user defaults
        favoritesDict = userDefaults.object(forKey: "favoritesDict") as? Dictionary<String, [String:String]> ?? [String:[String:String]]()
        for key in favoritesDict.keys {
            favoritesDictArray.append(key)
        }
        favoritesDictArray.sort()
                
        // Turns nightmode on or off based on what the user selected
        if nightmodeOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    // Prepare for a segue to the searchVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoritesSearchSegue" {
            let destinationVC = segue.destination as! SearchViewController
            let favoriteDict = favoritesDict[favoritesDictArray[row]]
            let contents = SearchBrain.getHTML(search: favoritesDictArray[row], type: favoriteDict!["type"]!)
            destinationVC.searchLabelText = contents
            destinationVC.search = favoritesDictArray[row]
            destinationVC.searchType = favoriteDict!["type"]!
            destinationVC.nightmodeOn = nightmodeOn
        }
    }
    
    // MARK: - Table View Data Source / Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesDictArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        let favoriteDict = favoritesDict[favoritesDictArray[indexPath.row]]
        cell.loadValues(searchLabelText: favoritesDictArray[indexPath.row], typeLabelText: favoriteDict!["type"]!, dateLabelText: favoriteDict!["date"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "favoritesSearchSegue", sender: self)
    }
    
}

