//
//  UserModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    static let sharedUserModel = UserModel()
    private let codingManager = NSCodingManager.sharedNSCodingManager
    private var userArray: Array<Leo> = []
    private let path = "UsersHemoLeo"
    
    private override init() {
        super.init()
        
        self.userArray = getUsers()
        
    }
    
    func getUsersCount() -> Int {
        return userArray.count
        
    }
    
    func getUsers() -> Array<Leo> {
        let array = codingManager.getAnyWithPath(path: path)
        
        if array == nil {
            return []
        }
        
        return array as! Array<Leo>
    }
    
    func createNewUser(nome: String, imagem: String) {
        let newLeo = Leo(nome: nome, imagem: imagem)
        
        userArray.append(newLeo)
        
        if !codingManager.saveAnyWithPath(path: path, object: userArray) {
            print("Erro, não foi possível salvar os dados")
        }
    }
    
    func setUser(index: Int) {
        
        Subject.sharedSubject.notify(leo: userArray[index] as Leo)
    }
    
    func getLeo(atIndex i: Int) -> Leo {
        return userArray[i]
    }
    
    private func getLeo(withId id: String) -> Leo? {
        for leo in userArray {
            if leo.getId() == id {
                return leo

            }
        }
        
        print("Usuário não encontrado")
        return nil
    }
}
