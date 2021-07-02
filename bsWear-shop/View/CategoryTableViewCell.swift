//
//  CategoryTableViewCell.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryIconImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 10
        backView.layer.masksToBounds = true
    }

}
