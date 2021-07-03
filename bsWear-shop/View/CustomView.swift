//
//  CustomButton.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 03.07.2021.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBtn()
    }
    
    func setupBtn() {
        layer.borderWidth = 1
        layer.cornerRadius = 15
        clipsToBounds = true
        
        tintColor = #colorLiteral(red: 0, green: 0.645577633, blue: 0.07150470763, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0, green: 0.645577633, blue: 0.07150470763, alpha: 1)
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
    }
}
