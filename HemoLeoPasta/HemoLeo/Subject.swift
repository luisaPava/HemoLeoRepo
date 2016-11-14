//
//  Subject.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

class Subject {
    private var arrayObserver: Array<Observer> = []
    private var leo: Leo!
    
    static let sharedSubject = Subject()
    
    func notify(leo: Leo) {
        self.leo = leo
        
        print(leo.nome)
        
        notifyAllObservers()
        
    }
    
    func getLeo() -> Leo {
        return leo
    }
    
    func attach(_ observer: Observer) {
        arrayObserver.append(observer)
    }
    
    private func notifyAllObservers() {
        print("notify")
        for observer in arrayObserver {
            print("notify")
            observer.update()
        }
    }
}
