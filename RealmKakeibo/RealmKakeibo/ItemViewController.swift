//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by Haruma Ito on 2024/02/09.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    var selectedCategory: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        navigationItem.title = selectedCategory.title
        items = readItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }

    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView" {
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
        }
    }
}

