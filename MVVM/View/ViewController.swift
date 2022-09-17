//
//  ViewController.swift
//  MVVM
//
//  Created by Nitish on 26/09/21.
//

import UIKit

class ViewController: UIViewController {

    var ViewModel = userViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ViewModel.vc = self
        ViewModel.getUserData()
    }
}

