//
//  DAOCalendario.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 01/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

class DAOCalendario: Observer {
    static var sharedDAOCalendario = DAOCalendario()
    
    private var array: [String : String] = [:]
    private var leo: Leo!
    private let codingManager = NSCodingManager.sharedNSCodingManager
    
    private var path: String {
        return "\(leo.getId())/Datas"
    }
    
    private override init() {
        super.init()
        
        self.subject = Subject.sharedSubject
        self.subject.attach(self)
        
        self.leo = self.subject.getLeo()
        
        populateArray(WithPath: path)
    }
    
    // Update the user
    override func update() {
        self.leo = subject.getLeo()
    }
    
    private func populateArray(WithPath path: String) {
        guard let testArray = codingManager.getAnyWithPath(path: path) else { return }
        
        array = testArray as! [String : String]
        
    }
    
    func getArrayCount() -> Int {
        return array.count
    }
    
    func events(at date: Date) -> Bool {
        if getValue(at: date) == nil {
            return false
        }
        
        return true
    }
    
    func append(newEvent event: String) {
        array[formatter.string(from: Date())] = event
        
        if !codingManager.saveAnyWithPath(path: path, object: array) {
            print("Erro ao salvar")
        }
    }
    
    func reloadData() {
        self.populateArray(WithPath: path)
    }
    
    func getValue(at key: Date) -> String? {
        guard let value = array[formatter.string(from: key)] else { return nil }
        
        return value
    }
}
