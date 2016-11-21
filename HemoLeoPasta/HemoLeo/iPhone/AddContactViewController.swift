//
//  AddContactViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddContactViewController: UIViewController {
    private let contactModel = ContactModel.sharedContactModel
    
    @IBOutlet weak var nome: SkyFloatingLabelTextField!
    @IBOutlet weak var relacao: SkyFloatingLabelTextField!
    @IBOutlet weak var telefone:SkyFloatingLabelTextField!
    @IBOutlet weak var email: SkyFloatingLabelTextField!
    @IBOutlet weak var tipo: SkyFloatingLabelTextField!

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
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
