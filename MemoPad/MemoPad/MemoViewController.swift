//
//  MemoViewController.swift
//  MemoPad
//
//  Created by Haruma Ito on 2024/02/03.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        saveData.register(defaults: ["titles": [], "contents": []])
        
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        
        print(titles)
        print(contents)
        
        titleTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func saveMemo(_ sender: Any) {
        let title = titleTextField.text
        let content = contentTextView.text
        
        titles.append(title!)
        contents.append(content!)
        
        saveData.set(titles, forKey: "titles")
        saveData.set(contents, forKey: "contents")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in self.navigationController?.popViewController(animated: true)}))
        
        present(alert, animated: true, completion: nil)
    }

}
