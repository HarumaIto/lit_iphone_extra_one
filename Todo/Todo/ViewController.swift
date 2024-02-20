//
//  ViewController.swift
//  Todo
//
//  Created by Haruma Ito on 2024/02/19.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    let realm = try! Realm()
    
    var todo: [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert: UIAlertController = UIAlertController(title: "TODOを削除しますか？", message: todo[indexPath.row].title, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "いいえ", style: .default,
                handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        alert.addAction(
            UIAlertAction(
                title: "はい", style: .default,
                handler: { action in
                    do {
                        try self.realm.write{
                            self.realm.delete(self.todo[indexPath.row])
                        }
                        self.todo = self.loadTodos()
                        self.table.reloadData()
                    } catch {
                        print("Error")
                    }
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todo = loadTodos()
        table.reloadData()
    }
}

