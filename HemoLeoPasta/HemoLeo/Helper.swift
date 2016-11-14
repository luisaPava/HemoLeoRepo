//
//  Helper.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 07/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import UIKit
import CareKit

let screenRect = UIScreen.main.bounds
let width = screenRect.size.width
let height = screenRect.size.height

let subject = Subject()

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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension FileManager.SearchPathDirectory {
    func createSubFolder(named: String, withIntermediateDirectories: Bool = false) -> URL? {
        guard let url = FileManager.default.urls(for: self, in: .userDomainMask).first else { return nil }
        
        do {
            try FileManager.default.createDirectory(at: url.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
            return url
        } catch let error as NSError {
            print("Deu erro")
            print(error.description)
            return nil
        }
    }
}
