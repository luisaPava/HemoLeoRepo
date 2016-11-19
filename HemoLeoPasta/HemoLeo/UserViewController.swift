//
//  UserViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    fileprivate let userModel = UserModel.sharedUserModel
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    @IBAction func chooseBtn(_ sender: UIButton) {
        userModel.setUser(index: Int(txtField.text!)!)
        
        performSegue(withIdentifier: "userToMain", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UserViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        userModel.setUser(index: indexPath.row)
        
        performSegue(withIdentifier: "userToMain", sender: self)
    }
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath as IndexPath) as! UserCollectionViewCell
        let leo = userModel.getLeo(atIndex: indexPath.row)
        
        cell.imagem.image =  UIImage(named: leo.getImage())
        cell.labelNome.text = leo.nome
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModel.getUsersCount()
    }
}
