//
//  Realm.swift
//  bsWear-shop
//
//  Created by Давид Тоноян  on 05.07.2021.
//

import RealmSwift

class Persistance {
    static let shared = Persistance()
    
    let realm = try! Realm()
    
    func realmWrite(_ product: Any) {
        try! realm.write{
            realm.add(product as! Object)
        }
    }
    
    func realmDelete(_ product: SelectedProduct) {
        try! realm.write{
            realm.delete(product)
        }
    }
    
    func realmRead() -> Results<SelectedProduct>? {
        let array = realm.objects(SelectedProduct.self)
        return array
    }
}
