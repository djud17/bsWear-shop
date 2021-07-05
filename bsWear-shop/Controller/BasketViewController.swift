//
//  BasketViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 05.07.2021.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var productsInBasket: [SelectedProduct] = []
    let currency = " \u{20BD}"
    var totalSum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Корзина"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        basketTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productsInBasket.removeAll()
        totalSum = 0
        if let basketProducts = Persistance.shared.realmRead() {
            for prod in basketProducts {
                productsInBasket.append(prod)
                
                if let sum = Int(beautyPrice(prod.productPrice, nil)) {
                    totalSum += sum
                }
                
            }
            totalPriceLabel.text = "\(totalSum)\(currency)"
            basketTableView.reloadData()
        }
    }
}
