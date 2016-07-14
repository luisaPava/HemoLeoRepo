//
//  ToAddedActivitiesData.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

struct ToAddActivitiesPropertyKey {
    static let activity: String = "toAddActivity"
}

class ToAddActivitiesData: NSObject, NSCoding {
    // MARK: Properties
    var activity: Dictionary<String, Bool>?
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("toAddActivities")
    
    // MARK: Initialization
    init(activityName: String) {
        // Initiliaze stored properties.
        self.activity![activityName] = false
        
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(activity, forKey: ToAddActivitiesPropertyKey.activity)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let activity = aDecoder.decodeObjectForKey(ToAddActivitiesPropertyKey.activity) as! String
        
        // Must call designated initializer.
        self.init(activityName: activity)
    }
}