//
//  LEO.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class Leo: NSObject, NSCoding {
    private let sharedDAOCK = DAOCloudKit.sharedDAOCK
    var nome: String!
    private var id: UUID!
    
    public required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.id = aDecoder.decodeObject(forKey: "id") as! UUID
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
        aCoder.encode(self.id, forKey: "id")
        
    }
    
    init(nome: String) {
        super.init()
        
        self.nome = nome
        self.id = UUID()
        
    }
    
    func getId() -> String {
        return id.uuidString
    }
}
 
