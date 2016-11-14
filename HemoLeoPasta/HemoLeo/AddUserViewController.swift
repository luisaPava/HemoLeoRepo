//
//  AddUserViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    @IBOutlet weak var txtField: UITextField!
    
    private let userModel = UserModel.sharedUserModel

    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        print("salvar")
        userModel.createNewUser(nome: txtField.text!)
        dismiss(animated: true, completion: nil)
    }
}
