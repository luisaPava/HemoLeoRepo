//
//  Actitvity.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

protocol Activity {
    var activityType: ActivityType { get }
    
    func carePlanActivity() -> OCKCarePlanActivity
}

// Enumeration of strings used as identifiers for the app activities
enum ActivityType: String {
    // Daily
    case Vegetables
    case Fruits
    case Water
    
    // Weekly (every Sunday by default)
    case Exercise  //É um group na verdade
    case Profilaxia //É um group na verdade
    case Fisiotherapy
    
    // Symptoms
    
    //Criar na pasta de sintomas!!
    case Sangramento
    case Hematoma
    case Dor
    case Emergencial
}
