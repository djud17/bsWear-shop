//
//  CategoryVCext.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import UIKit

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")
        let categoryModel = productCategories[indexPath.row]
        
        cell?.textLabel?.text = categoryModel.name
        
        return cell!
    }
}
