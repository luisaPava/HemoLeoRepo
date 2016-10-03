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
    public func encode(with aCoder: NSCoder) {
        
    }

    // MARK: Properties
    var activity: Dictionary<String, Bool>?
    
    static var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("toAddActivities")
    
    // MARK: Initialization
    init(activityName: String) {
        // Initiliaze stored properties.
        self.activity![activityName] = false
        
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(activity, forKey: ToAddActivitiesPropertyKey.activity)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let activity = aDecoder.decodeObject(forKey: ToAddActivitiesPropertyKey.activity) as! String
        
        // Must call designated initializer.
        self.init(activityName: activity)
    }
}
