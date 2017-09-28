//
//  ViewController.swift
//  OviaChallenge
//
//  Created by Rachel Schneebaum on 9/27/17.
//  Copyright © 2017 Rachel Schneebaum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TextManipulator {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var abbreviateLabel: UILabel!
    @IBOutlet private weak var clearButton: UIButton! {
        didSet {
            clearButton.isEnabled = false
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    @IBAction func onClearTapped(_ sender: UIButton) {
        sender.isEnabled = false

        textField.text = nil
        countLabel.text = nil
        abbreviateLabel.text = nil
    }
    
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let enteredText = textField.text else {
            clearButton.isEnabled = false
            return true
        }

        clearButton.isEnabled = true
        countLabel.text = count(enteredText)
        abbreviateLabel.text = abbreviate(enteredText)

        return true
    }
}
