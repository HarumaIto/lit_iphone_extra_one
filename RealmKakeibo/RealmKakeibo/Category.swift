//
//  Category.swift
//  RealmKakeibo
//
//  Created by Haruma Ito on 2024/02/09.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
