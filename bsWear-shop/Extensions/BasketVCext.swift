//
//  BasketVCext.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 05.07.2021.
//

import UIKit

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if productsInBasket.count == 0 {
            tableView.setEmptyMessage("Корзина пуста")
        } else {
            tableView.restore()
        }
        
        return productsInBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as! ProductInBasket
        let model = productsInBasket[indexPath.row]
        
        let url = URL(string: "http://blackstarshop.ru/\(model.productImage)")!
        
        cell.productImage.load(url)
        cell.productNameLabel.text = model.productName
        cell.productPriceLabel.text = beautyPrice(model.productPrice,currency)
        cell.productSizeLabel.text = "Размер: \(model.productSize)"
        
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product = self.productsInBasket[indexPath.row]
            
            self.productsInBasket.remove(at: indexPath.row)
            
            if let sum = Int(beautyPrice(product.productPrice, nil)) {
                totalSum -= sum
            }
            
            Persistance.shared.realmDelete(product)
            totalPriceLabel.text = "\(totalSum)\(currency)"
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
