//
//  Cells.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 22/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation

struct cells {
    var additionalRows: Int
    var cellIdentifier: String
    var isExpandable: Bool
    var isExpanded: Bool
    var isVisible: Bool
    var primaryTitle: String
    var secondaryTitle: String
    var value: String
    
    init(additionalRows: Int, cellIdentifier: String, isExpandable: Bool, isExpanded: Bool, isVisible: Bool, primaryTitle: String, secondaryTitle: String, value: String) {
        self.additionalRows = additionalRows
        self.cellIdentifier = cellIdentifier
        self.isExpandable = isExpandable
        self.isExpanded = isExpanded
        self.isVisible = isVisible
        self.primaryTitle = primaryTitle
        self.secondaryTitle = secondaryTitle
        self.value = value
    }
}