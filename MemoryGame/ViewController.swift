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
    }
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: false)
    }
    
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
        initLabels()
        resetTextFields()
        startGameButton.isHidden = false
    }
    
    @IBAction func submitAnswerBtnPressed(_ sender: UIButton) {
        checkAnswer()
        nextQuestionBtn.isHidden = false
    }
    @IBAction func nextQuestionBtnPressed(_ sender: UIButton) {
    }
    func initLabels() {
        for label in wordLabelsCollection {
            label.text = words[counter]
            counter += 1
        }
    }
    
    func resetTextFields() {
        for textField in answerTextFieldsCollection {
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.white
        }
    }
    
    func checkAnswer() {
        print("counter \(counter)")
        var currentWordIndex = counter - LABEL_NUM
        print("current index \(currentWordIndex)")
        for textField in answerTextFieldsCollection {
            if (textField.text?.isEmpty)! {
                textField.backgroundColor = UIColor.darkGray
            }
            else if textField.text == words[currentWordIndex] {
                textField.textColor = UIColor.green
            } else {
                textField.textColor = UIColor.red
            }
            currentWordIndex += 1
            
        }
    }
    
    func changeLabelHiddenStatus(hidden: Bool) {
        for label in wordLabelsCollection {
            label.isHidden = hidden
        }
    }


}

