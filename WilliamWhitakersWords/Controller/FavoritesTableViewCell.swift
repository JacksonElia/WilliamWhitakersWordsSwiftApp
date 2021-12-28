//
//  FavoritesTableViewCell.swift
//  WilliamWhitakersWords
//
//  Created by Jack Elia on 12/28/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let identifier = "favoritesCell"
    
    public func loadValues(searchLabelText: String, typeLabelText: String, dateLabelText: String) {
        searchLabel.text = searchLabelText
        typeLabel.text = typeLabelText
        dateLabel.text = dateLabelText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
