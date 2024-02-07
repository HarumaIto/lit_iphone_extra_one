//
//  ThirdViewController.swift
//  NavigationController
//
//  Created by Haruma Ito on 2024/02/07.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }

}
