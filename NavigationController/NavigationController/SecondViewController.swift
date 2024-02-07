//
//  SecondViewController.swift
//  NavigationController
//
//  Created by Haruma Ito on 2024/02/07.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }
}
