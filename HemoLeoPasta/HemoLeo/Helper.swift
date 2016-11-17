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
            print(error.description)
            return nil
        }
    }
}

extension FileManager {
    func clearFolder(atPath path: String) {
        let fileManager = FileManager.default
        
        let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let persistenceDirectoryURL = NSURL(fileURLWithPath: applicationSupportPath!).appendingPathComponent(path)
        
        do {
            let filePaths = try fileManager.contentsOfDirectory(atPath: (persistenceDirectoryURL?.path)!)
            for filePath in filePaths {
                print(filePath)
                try fileManager.removeItem(atPath: (persistenceDirectoryURL?.appendingPathComponent(filePath).path)!)
            }
        } catch let error as NSError {
            print("Could not clear temp folder: \(error.debugDescription)")
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


