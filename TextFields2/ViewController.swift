//
//  ViewController.swift
//  TextFields2
//
//  Created by Irene Naya on 9/21/17.
//  Copyright © 2017 OnkySoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var postCodeText: UITextField!
    @IBOutlet weak var cashText: UITextField!
    @IBOutlet weak var restrictedText: UITextField!
    @IBOutlet weak var switchy: UISwitch!
    
    var postCodeTFD = PostCodeTextFieldDelegates()
    var cashTFD = CashTextFieldDelegates()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign view elements to their corresponding delegates
        self.restrictedText.delegate = self
        postCodeText.delegate = postCodeTFD
        cashText.delegate = cashTFD
    }
    
    // this one simply checks the state of the switch to allow / disallow writing to the text view
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if switchy.on {
            return true
        }
        return false
    }

}

// delegate for cash input. Input should only be numerical and entered from right to left with only 
// 2 decimal spaces
class CashTextFieldDelegates: NSObject, UITextFieldDelegate {    
    
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

// delegates for postcode input. Only numbers allowed. Maximum length : 5
class PostCodeTextFieldDelegates: NSObject, UITextFieldDelegate {
    
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
