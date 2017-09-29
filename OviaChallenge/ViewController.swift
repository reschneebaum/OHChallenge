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
    @IBOutlet private weak var clearButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func onClearTapped(_ sender: UIButton) {
        sender.isEnabled = false

        textField.resignFirstResponder()
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
        onTextChange()
        return true
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        onTextChange()
    }
}


private extension ViewController {

    func setup() {
        clearButton.isEnabled = false
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    func onTextChange() {
        guard let enteredText = textField.text else {
            clearButton.isEnabled = false
            return
        }

        clearButton.isEnabled = true
        countLabel.text = count(enteredText)
        abbreviateLabel.text = abbreviate(enteredText)
    }
}
