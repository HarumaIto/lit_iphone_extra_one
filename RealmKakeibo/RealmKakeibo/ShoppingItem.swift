//
//  ShoppingItem.swift
//  RealmKakeibo
//
//  Created by Haruma Ito on 2024/02/09.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
}
