//
//  ProductViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var categoryId = ""
    var products: [Product] = []
    var currency = " \u{20BD}"
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Товары"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadData()
    }
    
    func loadData() {
        apiClient.getProducts(categoryId) { result in
            DispatchQueue.main.async {
                self.products = result
                self.productsCollectionView.reloadData()
            }
        }
    }
    
    func beautyPrice(_ price: String) -> String {
        let arr = price.components(separatedBy: ".")
        let newPrice = arr[0] + currency
        
        return newPrice
    }

}
