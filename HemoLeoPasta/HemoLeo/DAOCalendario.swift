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
    
    private var dic: [String : [String : [String]]] = [:]
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
        guard let testArray = codingManager.getAnyWithPath(path: path) else {
            dic = [:]
            
            return
        }
        
        dic = testArray as! [String : [String : [String]]]
        
    }
    
    func getCount(withDay day: Date) -> Int {
        let day = formatter.string(from: day)
        
        return dic[day]!.count
    }
    
    func getCount(withType type: EventType, day: Date) -> Int {
        let dayString = formatter.string(from: day)
        
        return dic[dayString]![type.rawValue]!.count
    }
    
    func events(at date: Date) -> Bool {
        let day = formatter.string(from: date)
        guard let _ = dic[day] else { return false }
        
        return true
    }
    
    func append(newEvent event: String, withType type: EventType) {
        let day = formatter.string(from: Date())
//
        if dic[day] == nil {
            dic[day] = [type.rawValue : [event]]
            
        } else if dic[day]?[type.rawValue] == nil {
            dic[day]?[type.rawValue] = [event]
        
        } else {
            dic[day]?[type.rawValue]?.append(event)
//
        }
//
        if !codingManager.saveAnyWithPath(path: path, object: dic) {
            print("Erro ao salvar")
        }
//        
//        print(dic[day]?.count)
    }
    
    func reloadData() {
        self.populateArray(WithPath: path)
    }
    
    func getValues(at key: Date) -> [EventType : [String]]? {
        let day = formatter.string(from: key)
        guard let value = dic[day] else { return nil }
        
        return convert(value)
    }
    
    func convert(_ value: [String : [String]]) -> [EventType : [String]] {
        var array: [EventType : [String]] = [:]
        
        for i in value {
            array[EventType(rawValue: i.key)!] = i.value
        }
        
        return array
    }
}
