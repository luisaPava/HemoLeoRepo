//
//  Observer.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

class Observer {
    var subject: Subject
    func update() { }
    
    init() {
        self.subject = Subject.sharedSubject
    }
}
