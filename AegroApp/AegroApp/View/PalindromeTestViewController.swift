//
//  PalindromeTestViewController.swift
//  AegroApp
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

class PalindromeTestViewController: UIViewController{
    
    @IBOutlet weak var palindromeTestTextField: UITextField!
    @IBOutlet weak var palindromeTestResultLabel: UILabel!
    
    private lazy var viewModel = PalindromeTestViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        palindromeTestTextField.delegate = self as UITextFieldDelegate
        palindromeTestTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        viewModel.palindromeResultText.bind(key: String(describing: self)) { (result) in
            self.palindromeTestResultLabel.text = result
        }
    }
    
}

extension PalindromeTestViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        palindromeTestTextField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else{
            return
        }

        if viewModel.isPalindrome(text){
            palindromeTestResultLabel.textColor = .white
        }else{
            palindromeTestResultLabel.textColor = .red
        }
    }
}
