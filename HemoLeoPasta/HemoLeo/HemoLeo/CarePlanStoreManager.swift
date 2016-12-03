//
//  CarePlanStoreManager.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class CarePlanStoreManager: NSObject, NSCoding {
    // MARK: Properties
    
    weak var delegate: CarePlanStoreManagerDelegate?
    
    var store: OCKCarePlanStore
    
    public required init?(coder aDecoder: NSCoder) {
        self.delegate = aDecoder.decodeObject(forKey: "delegate") as? CarePlanStoreManagerDelegate
        self.store = aDecoder.decodeObject(forKey: "store") as! OCKCarePlanStore
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.delegate, forKey: "delegate")
        aCoder.encode(self.store, forKey: "store")
        
    }
    
    // MARK: Initialization
    
    init(path: String) {
        // Determine the file URL for the store.
        let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let persistenceDirectoryURL = NSURL(fileURLWithPath: applicationSupportPath!).appendingPathComponent(path)
        
        if !FileManager.default.fileExists(atPath: persistenceDirectoryURL!.path, isDirectory: nil) {
            try! FileManager.default.createDirectory(at: persistenceDirectoryURL! as URL, withIntermediateDirectories: true, attributes: nil)
        }
        
        print(persistenceDirectoryURL!)
        
        
        // Create the store.
        store = OCKCarePlanStore(persistenceDirectoryURL: persistenceDirectoryURL! as URL)
        
        super.init()
        
        // Register this object as the store's delegate to be notified of changes.
        store.delegate = self

    }
}



extension CarePlanStoreManager: OCKCarePlanStoreDelegate {
    func carePlanStoreActivityListDidChange(_ store: OCKCarePlanStore) {
//        updateInsights()
    }
    
    func carePlanStore(_ store: OCKCarePlanStore, didReceiveUpdateOf event: OCKCarePlanEvent) {
//        updateInsights()
    }
}



protocol CarePlanStoreManagerDelegate: class {
    
    func carePlanStoreManager(manager: CarePlanStoreManager, didUpdateInsights insights: [OCKInsightItem])
    
}
