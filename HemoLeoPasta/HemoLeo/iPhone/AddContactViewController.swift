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
    @IBOutlet weak var segmentedTipo: ADVSegmentedControl!
    private var tipo: Int!
    
    fileprivate let arrayValues: Array<CGFloat> = [0, 30, 80, 110, 150]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nome.delegate = self
        relacao.delegate = self
        telefone.delegate = self
        email.delegate = self
        segmentedTipo.items[0] = "Equipe"
        segmentedTipo.items[1] = "Família"
        
    }

    @IBAction func save(_ sender: UIButton) {
        if (nome.text?.isEmpty)! || (relacao.text?.isEmpty)! || (telefone.text?.isEmpty)! || (email.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            contactModel.saveContact(tipo: segmentedTipo.selectedIndex,
                                     nome: nome.text!,
                                     relacao: relacao.text!,
                                     telefone: telefone.text!,
                                     email: email.text!)
        
            self.dismiss(animated: false, completion: nil)
        }
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
        animateViewMoving(true, moveValue: arrayValues[textField.tag])
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(false, moveValue: arrayValues[textField.tag])
    }
    
    
    
    func animateViewMoving(_ up: Bool, moveValue: CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nome {
            let _ = self.relacao.becomeFirstResponder()
            print(#function)
        }
        
        if textField == self.relacao   {
            let _ = self.telefone.becomeFirstResponder()
        }
        
        if textField == self.telefone {
            let _ = self.email.becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        
        return true
    }
    
}
