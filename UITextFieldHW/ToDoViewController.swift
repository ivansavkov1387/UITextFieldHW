//
//  ToDoViewController.swift
//  UITextFieldHW
//
//  Created by Иван on 6/6/21.
//

import UIKit

class ToDoViewController: UIViewController {
    
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func colorSwitchTapped(_ sender: UISwitch) {
        if !sender.isOn {
            view.backgroundColor = .black
            addButtonOutlet.tintColor = .white
            colorLabel.text = "Black"
            colorLabel.textColor = .white
            
        } else {
            view.backgroundColor = .white
            addButtonOutlet.tintColor = .black
            colorLabel.text = "White"
            colorLabel.textColor = .black
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
    }
    
    
}
