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
    
    var birthdayPicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        mailTextField.delegate = self
        birthdataTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (Notification) in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (Notification) in
            self.view.frame.origin.y = 0
        }
        
        
    }
    
    //MARK:- Methods
    
    func createDatePicker() {
        birthdayPicker.locale = .init(identifier: "Russian")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        birthdayPicker.preferredDatePickerStyle = .wheels
        birthdayPicker.datePickerMode = .date
        birthdataTextField.inputAccessoryView = toolbar
        birthdataTextField.inputView = birthdayPicker
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "Russian")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthdataTextField.text = formatter.string(from: birthdayPicker.date)
        self.view.endEditing(true)
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0: surnameTextField.becomeFirstResponder()
        case 1: mailTextField.becomeFirstResponder()
        case 2: birthdataTextField.becomeFirstResponder()
        default: textField.resignFirstResponder()
        //            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        return true
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
