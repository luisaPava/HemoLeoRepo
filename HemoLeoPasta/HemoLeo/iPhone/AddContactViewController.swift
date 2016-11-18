//
//  AddContactViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    private let contactModel = ContactModel.sharedContactModel
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var relacao: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var tipo: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func save(_ sender: UIButton) {
        contactModel.saveContact(tipo: Int(tipo.text!)!,
                                 nome: nome.text!,
                                 relacao: relacao.text!,
                                 telefone: telefone.text!,
                                 email: email.text!)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
