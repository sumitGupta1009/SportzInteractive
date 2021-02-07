//
//  InfoCollectionCell.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 07/02/21.
//

import UIKit

class InfoCollectionCell: UICollectionViewCell {
    @IBOutlet var infoLabel: UILabel! {
        didSet {
            infoLabel.font = UIFont.systemFont(ofSize: 14)
            infoLabel.textColor = UIColor.grayChetau
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(_ text: String) {
        infoLabel.text = text
    }
}
