//
//  CategoryVCext.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import UIKit

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if productCategories.count == 0 {
            tableView.setEmptyMessage("Нет записей")
        } else {
            tableView.restore()
        }
        
        return productCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryTableViewCell
        let categoryModel = productCategories[indexPath.row]
        
        cell.categoryNameLabel.text = categoryModel.name
        cell.categoryIconImageView.load(URL(string: "http://blackstarshop.ru/\(categoryModel.iconUrl)")!)

        if categoryModel.imageUrl != "" {
            cell.categoryImageView.load(URL(string: "http://blackstarshop.ru/\(categoryModel.imageUrl)")!)
        }
        
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "subCategoryVC") as! SubCategoryViewController
        
        
        productCategories[indexPath.row].subcategories.sort{$0.sortOrder < $1.sortOrder}
        viewController.subcategories = productCategories[indexPath.row].subcategories
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
