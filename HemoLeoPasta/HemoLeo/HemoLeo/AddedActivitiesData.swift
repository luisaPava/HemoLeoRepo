//
//  AddedActivitiesData.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

struct AddedActivitiesPropertyKey {
    static let activity: String = "addedActivity"
}

class AddedActivitiesData: NSObject, NSCoding {
    // MARK: Properties
    var activity: Dictionary<String, Bool>?
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("addedActivities")
    
    // MARK: Initialization
    init(activityName: String) {
        // Initiliaze stored properties.
        self.activity![activityName] = true
        
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(activity, forKey: AddedActivitiesPropertyKey.activity)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let activity = aDecoder.decodeObjectForKey(AddedActivitiesPropertyKey.activity) as! String
        
        // Must call designated initializer.
        self.init(activityName: activity)
    }
}