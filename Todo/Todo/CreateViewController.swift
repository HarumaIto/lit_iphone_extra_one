//
//  CreateViewController.swift
//  Todo
//
//  Created by Haruma Ito on 2024/02/19.
//

import UIKit
import RealmSwift

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func save() {
        let todo = Todo()
        todo.title = titleTextField.text ?? ""
        todo.content = contentTextView.text ?? ""
        try! realm.write {
            realm.add(todo)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
