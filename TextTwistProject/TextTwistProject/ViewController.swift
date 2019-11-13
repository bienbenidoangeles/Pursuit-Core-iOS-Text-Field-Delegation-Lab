//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessWord: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet var safeArea: UIView!
    @IBOutlet weak var nextWord: UIButton!
    
    var word = Word.getRandomWord()
    lazy var wordUnscrambled = word.unscrambled
    lazy var wordScrambled = word.scrambled
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guessWord.text = wordScrambled
        userInput.delegate = self
        nextWord.isHidden = true
    }
    @IBAction func newWord(_ sender: UIButton) {
        word = Word.getRandomWord()
        wordUnscrambled = word.unscrambled
        wordScrambled = word.scrambled
        view.backgroundColor = .white
        guessWord.text = wordScrambled
        nextWord.isHidden = true
        userInput.text = nil
    }
    
    func checkWordGuess(){
        let userWord = word.WordCheck(input: userInput.text ?? "Error")
        if userWord == .correct {
            view.backgroundColor = .green
            nextWord.isHidden = false
        } else {
            view.backgroundColor = .red
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkWordGuess()
        textField.resignFirstResponder()
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                
        if guessWord.text?.contains(string) ?? false{
            guessWord.text?.remove(at: (guessWord.text?.firstIndex(of: Character(string)))!)
        } else if string == ""{
            guessWord.text?.insert(userInput.text?.last ?? "a", at: guessWord.text!.endIndex)
        } else {
            return false
        }
        return true
    }
}

