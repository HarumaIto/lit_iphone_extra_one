//
//  NewItemViewController.swift
//  RealmKakeibo
//
//  Created by Haruma Ito on 2024/02/09.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    let realm = try! Realm()
    var category: Category!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.isMarked = markSwitch.isOn
        item.category = category
        createItem(item: item)
        
        self.dismiss(animated: true)
    }

    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }
}
