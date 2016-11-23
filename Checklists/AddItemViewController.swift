//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Tim Lauter on 11/17/16.
//  Copyright © 2016 timlauter. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishAddingItem item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishEditingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    var itemToEdit: ChecklistItem?
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            
        }
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinishAddingItem: item)
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String ) -> Bool {
    
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = (newText.length > 0)
        
        return true
    }
}
