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

let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return formatter
}()

public func mensagem(titulo: String, desc: String, view: UIViewController) {
    let alertController = UIAlertController(title: titulo, message: desc, preferredStyle: UIAlertControllerStyle.alert)
    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
    
    view.present(alertController, animated: true, completion: nil)
}

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

public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}

extension String {
    func getInitials() -> String {
        let stringInputArr = self.components(separatedBy: " ")
        var stringNeed = ""
        
        for string in stringInputArr {
            stringNeed = stringNeed + String(string.characters.first!)
        }
        
        return stringNeed
    }
    
    func getFirstWord() -> String {
        let stringInputArr = self.components(separatedBy: "- ")
        
        return stringInputArr.first!
    }
    
    func getFirstWordAndLetter() -> String {
        let stringInputArr = self.components(separatedBy: " ")
        let stringNeed = stringInputArr.first! + " " + String(stringInputArr[1].characters.first!)
        
        return stringNeed
        
    }
}

extension UITextView {
    func showInstructions(_ time: Double) {
        let _ = Timer.scheduledTimer(withTimeInterval: time, repeats: false, block: { _ in
            self.runAnimation(UIAnimation.fadeAlphaTo(1, duration: 2))
        
        })
    }
}

extension Float {
    var roundTof:Float {
        mutating get {
            return Float(Int(10.0  * self)/10)
        }
    }
}
