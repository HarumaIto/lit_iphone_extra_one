//
//  ViewController.swift
//  Todo
//
//  Created by Haruma Ito on 2024/02/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    
    var todo: [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        todo = loadTodos()
    }
    
    func loadTodos() -> [Todo] {
        return Array(realm.objects(Todo.self))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = todo[indexPath.row].title
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todo = loadTodos()
        table.reloadData()
    }
}

