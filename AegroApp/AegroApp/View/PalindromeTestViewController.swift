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
    
    @IBOutlet weak var wordsTableView: UITableView!
    
    private lazy var viewModel = PalindromeTestViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func cleanTableAction(_ sender: UIButton) {
        viewModel.cleanWords()
    }
    
    private func setup(){
        self.hideKeyboardFunction()
        viewModel.delegate = self
        palindromeTestTextField.delegate = self as UITextFieldDelegate
        palindromeTestTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        viewModel.palindromeResultText.bind(key: String(describing: self)) { (result) in
            self.palindromeTestResultLabel.text = result
        }
    }
    
}

extension PalindromeTestViewController: DataUpdate{
    func loadTable() {
        wordsTableView.reloadData()
    }
}

extension PalindromeTestViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        palindromeTestTextField.resignFirstResponder()
        return true
    }
    
    // Validates if the current typing word is palindrome
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
    
    // When the edition ends, if it is palindrome calls the view model to save the word
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else{
            return
        }
        viewModel.saveNewPalindromeWord(text)
        self.wordsTableView.reloadData()
    }
}

extension PalindromeTestViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.deleteWordAt(index: indexPath.row)
            self.wordsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension PalindromeTestViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPalindromeWords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wordsTableView.dequeueReusableCell(withIdentifier: "palindromeCell", for: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text = viewModel.getWordAt(index: indexPath.row)
        
        return cell
    }
}

extension UIViewController {
    func hideKeyboardFunction() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
