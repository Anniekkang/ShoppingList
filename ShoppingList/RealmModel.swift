//
//  RealmModel.swift
//  ShoppingList
//
//  Created by 나리강 on 2022/08/22.
//

import UIKit
import RealmSwift



class shoppingApp : Object {
    @Persisted var favorite : Bool
    @Persisted var checkbox : Bool
    @Persisted var list : String
    
    @Persisted(primaryKey: true) var objectId : ObjectId
    
    convenience init(list : String) {
        self.init()
        self.favorite = false
        self.checkbox = false
        self.list = list
        
    }
}
