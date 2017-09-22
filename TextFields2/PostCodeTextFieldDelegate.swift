//
//  PostCodeTextFieldDelegate.swift
//  TextFields2
//
//  Created by Irene Naya on 9/21/17.
//  Copyright © 2017 OnkySoft. All rights reserved.
//

import UIKit

class PostCodeTextFieldDelegate: NSObject, UITextFieldDelegate {

    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        if newText.length > 5 {
            return false
        }
        if (string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet()) != nil) ||
        (string.rangeOfCharacterFromSet(NSCharacterSet.punctuationCharacterSet()) != nil) {
            return false
        }
      
        return true
    }
}
