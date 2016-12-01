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
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let userModel = UserModel.sharedUserModel
    fileprivate let arraySkins: Array<String> = ["Leo", "Leo", "Leo", "Leo"]
    fileprivate var imagem: String = "Leo"
    fileprivate var selectedIndex: IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))

        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        txtField.delegate = self

//        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        if (txtField.text?.isEmpty)! {
            
            let alertController = UIAlertController(title: "Atenção", message:
                "Você deve preencher o campo com o seu nome completo", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            userModel.createNewUser(nome: txtField.text!, imagem: imagem)
            dismiss(animated: true, completion: nil)
            
        }
    }
}

extension AddUserViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: selectedIndex!) as! AddUserCollectionViewCell
        
        if selectedIndex != nil {
            let cell = collectionView.cellForItem(at: selectedIndex!) as! AddUserCollectionViewCell
//            cell.leoShadow.isHidden = true
        }
        
        selectedIndex = indexPath
//        selectedCell.leoShadow.isHidden = false
    }
}

extension AddUserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(arraySkins.count)
        return arraySkins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addUserCell", for: indexPath as IndexPath) as! AddUserCollectionViewCell
        
        cell.imagem.image =  UIImage(named: arraySkins[indexPath.row])
        
        return cell
    }
}

extension AddUserViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(true, moveValue: 250)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(false, moveValue: 250)
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
