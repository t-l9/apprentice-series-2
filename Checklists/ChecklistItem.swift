//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Tim Lauter on 11/16/16.
//  Copyright © 2016 timlauter. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
