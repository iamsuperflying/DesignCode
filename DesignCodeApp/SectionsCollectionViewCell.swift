//
//  SectionsCollectionViewCell.swift
//
//  Created by LPF. on 2018/9/4.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    var section: [String: String] = [:] {
         didSet {
            self.titleLabel.text = section["title"]
            self.captionLabel.text = section["caption"]
            self.coverImageView.image = UIImage(named: section["image"]!)
        }
    }
}
