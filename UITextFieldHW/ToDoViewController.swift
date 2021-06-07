//
//  ToDoViewController.swift
//  UITextFieldHW
//
//  Created by Иван on 6/6/21.
//

import UIKit

class ToDoViewController: UIViewController {
    
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorSwitch: UISwitch!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    
    private let x = 20
    private var y = 80
    private var message = ""
    private var arrayOfTaskLabels = [UILabel()]
    
    //MARK:- Methods
    
    private func createAlert() {
        let alert = UIAlertController(title: "Enter your task", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            self.message = alert.textFields?[0].text ?? ""
            guard self.message == "" else {
                self.addLabel()
                self.changeTextColorOfTaskLabels(isOn: self.colorSwitch.isOn)
                return
            }
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    private func addLabel() {
        let height = 40
        let width = Int(self.view.frame.width - 20)
        let label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        y += 40
        label.text = "\(message)"
        
        arrayOfTaskLabels.append(label)
        view.addSubview(label)
    }
    
    private func changeTextColorOfTaskLabels(isOn: Bool) {
        for label in arrayOfTaskLabels {
            if isOn {
                label.textColor = .black
            } else {
                label.textColor = .white
            }
        }
    }
    
    
    //MARK:- IBOutlets
    
    @IBAction func colorSwitchTapped(_ sender: UISwitch) {
        if !sender.isOn {
            view.backgroundColor = .black
            addButtonOutlet.tintColor = .white
            colorLabel.text = "Black"
            colorLabel.textColor = .white
            changeTextColorOfTaskLabels(isOn: colorSwitch.isOn)
            
        } else {
            view.backgroundColor = .white
            addButtonOutlet.tintColor = .black
            colorLabel.text = "White"
            colorLabel.textColor = .black
            changeTextColorOfTaskLabels(isOn: colorSwitch.isOn)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        createAlert()
    }
    
    
}
