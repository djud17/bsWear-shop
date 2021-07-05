//
//  ProductViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var categoryId = ""
    var categoryName = ""
    let currency = " \u{20BD}"
    var products: [Product] = []
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = categoryName
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
    
    

}
