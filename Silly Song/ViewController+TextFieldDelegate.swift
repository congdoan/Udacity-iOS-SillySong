//
//  ViewController+TextFieldDelegate.swift
//  Silly Song
//
//  Created by Cong Doan on 10/6/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Call resignFirstResponder to both hide keyboard and trigger text field’s “Editing Did End” event
        textField.resignFirstResponder()
        // Return false to prevent any other response to the return key
        return false
    }
}
