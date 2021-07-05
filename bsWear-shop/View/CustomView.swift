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
        
        tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 17)
    }
}

class CustomBackView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        layer.borderWidth = 1
        layer.cornerRadius = 15
        clipsToBounds = false
        
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
    }
}
