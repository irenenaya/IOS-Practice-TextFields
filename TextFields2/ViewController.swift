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
    
    var postCodeTF = PostCodeTextFieldDelegate()
    var cashTF = CashTextFieldDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.restrictedText.delegate = self
        postCodeText.delegate = postCodeTF
        cashText.delegate = cashTF
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 /*   func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        if newText.length > 5 {
            return false
        }
        if (string.rangeOfCharacterFromSet(NSCharacterSet.letterCharacterSet()) != nil)  {
            return false
        }
        return true
    }*/
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if switchy.on {
            return true
        }
        return false
    }
    

}

