//
//  Model.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import Foundation

class ProductCategory {
    let name: String
    let sortOrder: Int
    let iconUrl: String
    let imageUrl: String
    var subcategories: [SubCategory] = []
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
            let sortOrder = data["sortOrder"] as? String,
            let iconUrl = data["iconImage"] as? String,
            let imageUrl = data["image"] as? String,
            let subcategories = data["subcategories"] as? [Dictionary<String, Any>] else {
                return nil
        }
        
        self.name = name
        self.sortOrder = Int(sortOrder) ?? 0
        self.imageUrl = imageUrl
        self.iconUrl = iconUrl
        
        for dict in subcategories {
            var subCategory = SubCategory()
            for _ in dict {
                if let id = dict["id"] as? String,
                      let iconImage = dict["iconImage"] as? String,
                      let sortOrder = dict["sortOrder"] as? String,
                      let name = dict["name"] as? String,
                      let type = dict["type"] as? String {
                    subCategory.id = id
                    subCategory.iconImage = iconImage
                    subCategory.sortOrder = sortOrder
                    subCategory.name = name
                    subCategory.type = type
                }
            }
            self.subcategories.append(subCategory)
        }
    }
}

struct SubCategory {
    var id: String = ""
    var iconImage: String = ""
    var sortOrder: String = ""
    var name: String = ""
    var type: String = ""
}
