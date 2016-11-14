//
//  UserViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    private let userModel = UserModel.sharedUserModel
    private var userCount: Int!
    @IBOutlet weak var txtField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userCount = userModel.getUsersCount()
        print(userCount)
        
        self.hideKeyboardWhenTappedAround()

    }

    @IBAction func chooseBtn(_ sender: Any) {
        userModel.setUser(index: Int(txtField.text!)!)
        
        performSegue(withIdentifier: "userToMain", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
