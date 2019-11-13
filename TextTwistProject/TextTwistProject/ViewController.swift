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
    
    var word = Word.getRandomWord() // Word Data type
    lazy var wordUnscrambled = word.unscrambled
    lazy var wordScrambled = word.scrambled //String of Word Scrambled
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guessWord.text = wordScrambled
        userInput.delegate = self
        nextWord.isHidden = true
    }
    @IBAction func newWord(_ sender: UIButton) {
        //get refresh of new word
        word = Word.getRandomWord() // Word Data type
        wordUnscrambled = word.unscrambled
        wordScrambled = word.scrambled //String
        view.backgroundColor = .white
        guessWord.text = wordScrambled
        nextWord.isHidden = true
    }
    
    func checkWordGuess(){
        let userWord = word.WordCheck(input: userInput.text ?? "Error")
        if userWord == .correct {
            view.backgroundColor = .green
            nextWord.isHidden = false
        } else {
            view.backgroundColor = .red
            guessWord.text?.append("\nThe correct word is: \(wordUnscrambled)") 
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkWordGuess()
        //safeArea change color
        textField.resignFirstResponder()
        //another function to get a new game
        //textField.text = nil
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if guessWord.text?.contains(string) ?? false{
            guessWord.text?.remove(at: (guessWord.text?.firstIndex(of: Character(string)))!)
        } else if string == ""{
            //print("Delete detected")
            //guessWord.text?.insert(Character(string), at: guessWord.text!.endIndex)
        } else {
            //could change game label to state that
            return false
            //guessWord.text?.insert(Character(string), at: guessWord.text!.endIndex)
        }
        return true
    }
}

