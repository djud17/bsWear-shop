//
//  ProductVCext.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

extension SubCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subcategories.count == 0 {
            tableView.setEmptyMessage("Нет записей")
        } else {
            tableView.restore()
        }
        
        return subcategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryTableViewCell
        let subCategoryModel = subcategories[indexPath.row]
        
        cell.categoryNameLabel.text = subCategoryModel.name
        
        if subCategoryModel.iconImage != "" {
            cell.categoryIconImageView.load(URL(string: "http://blackstarshop.ru/\(subCategoryModel.iconImage)")!)
        }
        
        return cell
    }
}

extension SubCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "productVC") as! ProductViewController
        
        viewController.categoryId = subcategories[indexPath.row].id
        
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
