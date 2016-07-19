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
    
    private override init(){}
    
    
    // MARK: NSCoding
    
    func loadAddedActivitiesData() -> [Bool]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(AddedActivitiesData.ArchiveURL.path!) as? [Bool]
    }
    
    func loadToAddActivitiesData() -> [Bool]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(ToAddActivitiesData.ArchiveURL.path!) as? [Bool]
    }
    
    func saveAddedActivitiesData(activities: Array<Bool>) {
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: AddedActivitiesData.ArchiveURL.path!)
        
        if !isSuccessfullSave {
            print("Failed to save 'added' activities...")
        }
    }
    
    func saveToAddActivitiesData(activities: Array<Bool>) {
        let isSuccessfullSave = NSKeyedArchiver.archiveRootObject(activities, toFile: ToAddActivitiesData.ArchiveURL.path!)
        
        if !isSuccessfullSave {
            print("Failed to save 'to add' activities...")
        }
    }
    

    
}