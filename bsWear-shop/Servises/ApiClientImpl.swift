//
//  ApiClientImpl.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import Foundation
import Alamofire

protocol ApiClient {
    func getData(completion: @escaping ([ProductCategory]) -> Void)
}

class ApiClientImpl: ApiClient {
    func getData(completion: @escaping ([ProductCategory]) -> Void) {
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
}
