//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Tim Lauter on 11/17/16.
//  Copyright © 2016 timlauter. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        dismiss(animated: true, completion: nil)
    }
}
