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
    
    func saveAddedActivitiesData(activities: Array<Bool>) {
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: AddedActivitiesData.ArchiveURL.path)
        
        if !isSuccessfullSave {
            print("Failed to save 'added' activities...")
        }
    }
    
    func saveToAddActivitiesData(activities: Array<Bool>) {
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: ToAddActivitiesData.ArchiveURL.path)
        
        if !isSuccessfullSave {
            print("Failed to save 'to add' activities...")
        }
    }
}
