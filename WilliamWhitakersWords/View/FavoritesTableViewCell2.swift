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
    
    var searchLabelText = ""
    var typeLabelText = ""
    var dateLabelText = ""
    
    static let identifier = "favoritesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchLabel.text = searchLabelText
        typeLabel.text = typeLabelText
        dateLabel.text = dateLabelText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
