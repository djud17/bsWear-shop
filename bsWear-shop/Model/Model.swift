//
//  Model.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 01.07.2021.
//

import Foundation
import RealmSwift

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
            var isEmpty = true
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
                    isEmpty = !isEmpty
                }
            }
            if !isEmpty {
                self.subcategories.append(subCategory)
            }
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

class Product {
    var name: String = ""
    var sortOrder: String = ""
    var article: String = ""
    var description: String = ""
    var colorName: String = ""
    var colorImageURL: String = ""
    var mainImage: String = ""
    var productImages: [ProductImage] = []
    var offers: [Offer] = []
    var price: String = ""
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
              let sortOrder = data["sortOrder"] as? String,
              let article = data["article"] as? String,
              let description = data["description"] as? String,
              let colorName = data["colorName"] as? String,
              let colorImageURL = data["colorImageURL"] as? String,
              let mainImage = data["mainImage"] as? String,
              let price = data["price"] as? String,
              let offers = data["offers"] as? [Dictionary<String, Any>],
              let productImages = data["productImages"] as? [Dictionary<String, Any>] else {
            return nil
        }
        
        self.name = name
        self.sortOrder = sortOrder
        self.article = article
        self.description = description
        self.colorName = colorName
        self.colorImageURL = colorImageURL
        self.mainImage = mainImage
        self.price = price
        
        for dict in productImages {
            var productImage = ProductImage()
            for _ in dict {
                if let imageURL = dict["imageURL"] as? String,
                      let sortOrder = dict["sortOrder"] as? String {
                    productImage.imageURL = imageURL
                    productImage.sortOrder = sortOrder
                }
            }
            self.productImages.append(productImage)
        }
        
        for dict in offers {
            var offer = Offer()
            for _ in dict {
                if let size = dict["size"] as? String,
                   let productOfferID = dict["productOfferID"] as? String,
                      let quantity = dict["quantity"] as? String {
                    offer.size = size
                    offer.productOfferID = productOfferID
                    offer.quantity = quantity
                }
            }
            self.offers.append(offer)
        }
    }
}

struct ProductImage {
    var imageURL: String = ""
    var sortOrder: String = ""
}

struct Offer {
    var size: String = ""
    var productOfferID: String = ""
    var quantity: String = ""
}

class SelectedProduct: Object {
    @objc dynamic var productName: String = ""
    @objc dynamic var productSize: String = ""
    @objc dynamic var productImage: String = ""
    @objc dynamic var productPrice: String = ""
}


