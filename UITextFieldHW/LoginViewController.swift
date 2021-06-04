//
//  ViewController.swift
//  UITextFieldHW
//
//  Created by Иван on 6/3/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var birthdataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        mailTextField.delegate = self
        birthdataTextField.delegate = self
    }


}

extension LoginViewController: UITextFieldDelegate {
    
}

