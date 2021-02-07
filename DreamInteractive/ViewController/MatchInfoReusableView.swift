//
//  MatchInfoReusableView.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 07/02/21.
//

import UIKit

class MatchInfoReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
            headerLabel.textColor = .demBlack
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .grayBack
    }
    
    func configView(_ text: String) {
        headerLabel.text = text
    }
}
