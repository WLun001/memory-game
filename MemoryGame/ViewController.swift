//
//  ViewController.swift
//  MemoryGame
//
//  Created by Wei Lun on 27/06/2018.
//  Copyright © 2018 Wei Lun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wordLabelsCollection: [UILabel]!
    @IBOutlet var answerTextFieldsCollection: [UITextField]!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var nextQuestionBtn: UIButton!
    
    private let LABEL_NUM = 7
    private let words = Words().words
    private var counter = 0
    
    enum Answer {
        case Correct
        case Wrong
        case Blank
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: true)
        startGameButton.isHidden = true
        changeTextFieldEnableStatus(enable: true)
    }
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: false)
        checkAnswer()
        changeTextFieldEnableStatus(enable: false)
    }
    
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
        initLabels()
        resetTextFields()
        startGameButton.isHidden = false
        changeTextFieldEnableStatus(enable: false)
    }
    
    @IBAction func submitAnswerBtnPressed(_ sender: UIButton) {
        checkAnswer()
        changeTextFieldEnableStatus(enable: false)
        nextQuestionBtn.isHidden = false
    }
    @IBAction func nextQuestionBtnPressed(_ sender: UIButton) {
    }
    func initLabels() {
        counter = 0
        for label in wordLabelsCollection {
            label.text = words[counter]
            counter += 1
        }
    }
    
    func resetTextFields() {
        for textField in answerTextFieldsCollection {
            textField.text = ""
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.white
        }
    }
    
    func changeTextFieldEnableStatus(enable: Bool) {
        for textField in answerTextFieldsCollection {
            textField.isEnabled = enable
        }
    }
    
    func checkAnswer() {
        print("counter \(counter)")
        var currentWordIndex = counter - LABEL_NUM
        print("current index \(currentWordIndex)")
        for textField in answerTextFieldsCollection {
            if (textField.text?.isEmpty)! {
                displayAnswerCorrectness(textField, answer: .Blank)
            }
            else if textField.text == words[currentWordIndex] {
                displayAnswerCorrectness(textField, answer: .Correct)
            } else {
                displayAnswerCorrectness(textField, answer: .Wrong)
            }
            currentWordIndex += 1
            
        }
    }
    
    func displayAnswerCorrectness(_ textField: UITextField, answer: Answer) {
        if answer == Answer.Correct {
            textField.textColor = UIColor.green
        } else if answer == Answer.Wrong {
            textField.textColor = UIColor.red
        } else {
            textField.backgroundColor = UIColor.darkGray
        }
    }
    func changeLabelHiddenStatus(hidden: Bool) {
        for label in wordLabelsCollection {
            label.isHidden = hidden
        }
    }


}

