//
//  NSCOdingManager.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/19/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation


class NSCodingManager: NSObject {
    
    static var sharedNSCodingManager = NSCodingManager()
    private let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private override init() { }
    
    
    // MARK: NSCoding
    
    func loadAddedActivitiesData() -> [Bool]? {
        let archiveURL = documentsDirectory.appendingPathComponent("addedActivities")

        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [Bool]
    }
    
    func loadBackground() -> String {
        let archiveURL = documentsDirectory.appendingPathComponent("background")
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as! String
    }
    
    func saveOccurencies(occurencies: Array<Int>) -> Bool {
        let archiveURL = documentsDirectory.appendingPathComponent("Occurencies")
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(occurencies, toFile: archiveURL.path)
        
        if !isSuccessfullSave {
            return false
        }
        
        return true
    }
    
    func getAnyWithPath(path: String) -> Any? {
        let archiveURL = documentsDirectory.appendingPathComponent(path)
        
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path)
    }
    
    func saveAnyWithPath(path: String, object: Any) -> Bool {
        let archiveURL = documentsDirectory.appendingPathComponent(path)
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(object, toFile: archiveURL.path)
        
        if !isSuccessfullSave {
            return false
        }
        
        return true
    }
    
    func setBackground(bg: String) {
        let archiveURL = documentsDirectory.appendingPathComponent("background")
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(bg, toFile: archiveURL.path)
        
        if !isSuccessfullSave {
            print("Failed to save Background")
        }
    }
    
    func loadToAddActivitiesData() -> [Bool]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ToAddActivitiesData.ArchiveURL.path) as? [Bool]
    }
    
    func saveAddedActivitiesData(activities: Array<Bool>/*, path: String*/) {
//        let archiveURL = documentsDirectory.appendingPathComponent(path)
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: ToAddActivitiesData.ArchiveURL.path)
        
        if !isSuccessfullSave {
            print("Failed to save 'added' activities...")
        }
    }
    
    func saveToAddActivitiesData(activities: Array<Bool>/*, path: String*/) {
//        let archiveURL = documentsDirectory.appendingPathComponent(path)
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: ToAddActivitiesData.ArchiveURL.path)
        
        if !isSuccessfullSave {
            print("Failed to save 'to add' activities...")
        }
    }
}
