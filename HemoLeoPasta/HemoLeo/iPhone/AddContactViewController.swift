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
        
        nome.delegate = self
        relacao.delegate = self
        telefone.delegate = self
        email.delegate = self
        tipo.delegate = self
        
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

extension AddContactViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(true, moveValue: 270)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(false, moveValue: 270)
    }
    
    
    func animateViewMoving(_ up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
