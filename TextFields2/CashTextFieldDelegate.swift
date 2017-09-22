//
//  CashTextFieldDelegate.swift
//  TextFields2
//
//  Created by Irene Naya on 9/21/17.
//  Copyright © 2017 OnkySoft. All rights reserved.
//

import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {


    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        
        // add new characters to textField string
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // edit string by removing '$' and '.'
        newText = newText.substringFromIndex(1)
        newText = newText.stringByReplacingOccurrencesOfString(".", withString: "")
        
        // convert to int. It will remove leading 0s
        let textInt = Int(String(newText))
        
        // textInt will be nil if the user entered a non numeric character (keyboard doesn't allow it, just extra safety)
        if textInt == nil {
            return false
        }
        // extract two ints: one for the integer and one for the decimal part
        let dollars = String(textInt! / 100)
        let centsVal = textInt! % 100
        let cents = centsVal > 9 ? String(centsVal) : "0"+String(centsVal)
        
        // we update textfield manually, therefore we return false
        textField.text = "$" + dollars + "." + cents
        return false
        
    }
}
