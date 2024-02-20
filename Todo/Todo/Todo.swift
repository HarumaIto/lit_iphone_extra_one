//
//  Todo.swift
//  Todo
//
//  Created by Haruma Ito on 2024/02/19.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var title: String = ""
    @Persisted var content: String = ""
}
