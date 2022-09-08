//
//  MealCollectionViewCell.swift
//  RandoMeal
//
//  Created by RMakuchowski on 08/09/2022.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.layer.borderWidth = 0.5
        nameLabel.layer.cornerRadius = 5
        nameLabel.layer.backgroundColor = UIColor(red: 0.92, green: 0.88, blue: 0.31, alpha: 1.00).cgColor
        nameLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        imageView.layer.cornerRadius = 5
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

}
