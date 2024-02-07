//
//  ViewController.swift
//  NavigationController
//
//  Created by Haruma Ito on 2024/02/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonSecoundTapped() {
        self.performSegue(withIdentifier: "toThirdViewController", sender: nil)
    }
}

