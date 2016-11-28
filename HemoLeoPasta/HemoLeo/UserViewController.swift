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
    fileprivate var selectedIndex: Int? = nil
    
    @IBOutlet weak var bgView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bgView.layer.zPosition = -1000
        collectionView.delegate = self
        collectionView.dataSource = self
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension UserViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath as IndexPath) as! UserCollectionViewCell
        let leo = userModel.getLeo(atIndex: indexPath.row)
        
        cell.imagem.image =  UIImage(named: leo.getImage())
        cell.imagem.layer.borderWidth = 5
        print(leo.nome)
        cell.labelNome.text = leo.nome
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModel.getUsersCount()
    }
}
