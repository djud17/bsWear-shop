//
//  ApiClientImpl.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import Foundation
import Alamofire

protocol ApiClient {
    func getCategories(completion: @escaping ([ProductCategory]) -> Void)
    func getProducts(_ id: String, completion: @escaping ([Product]) -> Void)
}

class ApiClientImpl: ApiClient {
    func getCategories(completion: @escaping ([ProductCategory]) -> Void) {
        var categories: [ProductCategory] = []
        let url = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")!
        
        AF.request(url).responseJSON { response in
            if let objects = response.value ,
               let jsonDict = objects as? NSDictionary {
                for (_, data) in jsonDict where data is NSDictionary{
                    if let category = ProductCategory(data: data as! NSDictionary) {
                        categories.append(category)
                    }
                }
                completion(categories)
            }
        }
    }
    
    func getProducts(_ categoryId: String, completion: @escaping ([Product]) -> Void) {
        let url =  URL(string: "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(categoryId)")!
        var products: [Product] = []
        
        AF.request(url).responseJSON { response in
            if let objects = response.value ,
               let jsonDict = objects as? NSDictionary {
                for (_, data) in jsonDict where data is NSDictionary{
                    if let product = Product(data: data as! NSDictionary) {
                        products.append(product)
                    }
                }
                completion(products)
            }
        }
        
    }
}
