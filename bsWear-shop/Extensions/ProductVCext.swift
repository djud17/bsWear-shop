//
//  ProductVCext.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 02.07.2021.
//

import UIKit

extension ProductListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
        let model = products[indexPath.row]
        let url = URL(string: "http://blackstarshop.ru/\(model.mainImage)")!
        
        cell.productImage.load(url)
        cell.productNameLabel.text = model.name
        cell.productPriceLabel.text = beautyPrice(model.price,currency)
        
        return cell
    }
}

extension ProductListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(identifier: "productCardVC") as! ProductCardViewController
        
        viewController.product = products[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
