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
            print("array == nil")
            return []
        }
        
        return array as! Array<Leo>
    }
    
    func createNewUser(nome: String) {
        print(#function)
        let newLeo = Leo(nome: nome)
        
        
        userArray.append(newLeo)
        
        codingManager.saveAnyWithPath(path: path, object: userArray)
    }
    
    func setUser(index: Int) {
//        print(userArray[index].nome)
        
        Subject.sharedSubject.notify(leo: userArray[index] as Leo)
    }
}
