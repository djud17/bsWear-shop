//
//  ProductViewController.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

class SubCategoryViewController: UIViewController {
    
    @IBOutlet weak var subCategoryTableView: UITableView!
    
    var subcategories: [SubCategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Подкатегории"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        subCategoryTableView.tableFooterView = UIView()
    }

}
