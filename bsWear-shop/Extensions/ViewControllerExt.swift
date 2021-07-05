//
//  ViewControllerExt.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 04.07.2021.
//

import UIKit

extension UIViewController {    
    func beautyPrice(_ price: String,_ currency: String?) -> String {
        let arr = price.components(separatedBy: ".")
        let newPrice = arr[0] + (currency ?? "")
        
        return newPrice
    }
}
