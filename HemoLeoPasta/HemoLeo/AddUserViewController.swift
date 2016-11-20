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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

//        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        userModel.createNewUser(nome: txtField.text!, imagem: imagem)
        dismiss(animated: true, completion: nil)
    }
}

extension AddUserViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arraySkins[indexPath.row])
        imagem = arraySkins[indexPath.row]
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
