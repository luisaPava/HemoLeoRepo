//
//  Helper.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 07/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import UIKit

let screenRect = UIScreen.main.bounds
let width = screenRect.size.width
let height = screenRect.size.height

extension Array where Element: Equatable {
    func allElementsAreEqual(to i: Element) -> Bool {
        for j in self {
            if j != i {
                return false
            }
        }
        
        return true
    }
}
