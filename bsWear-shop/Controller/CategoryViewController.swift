//
//  ViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    var productCategories: [ProductCategory] = []
    let apiClient: ApiClient = ApiClientImpl()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Категории"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        categoryTableView.tableFooterView = UIView()
        
        loadData()
    }
    
    func loadData() {
        apiClient.getData { result in
            DispatchQueue.main.async {
                self.productCategories = result
                self.productCategories.sort{$0.sortOrder < $1.sortOrder}
                self.categoryTableView.reloadData()
            }
        }
    }

}

