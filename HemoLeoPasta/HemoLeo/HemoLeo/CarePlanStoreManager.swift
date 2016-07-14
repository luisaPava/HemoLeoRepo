//
//  CarePlanStoreManager.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class CarePlanStoreManager: NSObject, OCKCarePlanStoreDelegate{

    // MARK: - Static properties
    static var sharedCarePlanStoreManager = CarePlanStoreManager()
    
    // MARK: - Properties
    weak var delegate: CarePlanStoreManagerDelegate?
    
    let store: OCKCarePlanStore
    
    // MARK: - Initialization
    private override init() {
        print(#function)
        
        // Set the file URL fore CareKit's store
        let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true).first
        let persistenceDirectoryURL = NSURL(fileURLWithPath: applicationSupportPath!)
        
        if !NSFileManager.defaultManager().fileExistsAtPath(persistenceDirectoryURL.absoluteString, isDirectory: nil) {
            try! NSFileManager.defaultManager().createDirectoryAtURL(persistenceDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        }
        
        // Create the store
        store = OCKCarePlanStore(persistenceDirectoryURL: persistenceDirectoryURL)
        
        super.init()
        
        // Register this object as the store's delegate to be notified of any changes.
        store.delegate = self
        
        print("init2")
    }
}

protocol CarePlanStoreManagerDelegate: class {
    func carePlanStoreManager(manager: CarePlanStoreManager)
}

