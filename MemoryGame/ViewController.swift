//
//  ViewController.swift
//  MemoryGame
//
//  Created by Wei Lun on 27/06/2018.
//  Copyright © 2018 Wei Lun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet var wordLabelsCollection: [UILabel]!
    @IBOutlet var answerTextFieldsCollection: [UITextField]!
    @IBOutlet var gameStartButtonCollection: [UIButton]!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var nextQuestionBtn: UIButton!
    
    private let LABEL_NUM = 7
    private let words = Words().words
    private var counter = 0
    private var progress = 1
    
    enum Answer {
        case Correct
        case Wrong
        case Blank
    }
    
    enum QuestionSet: Int {
        case Set1 = 0
        case Set2 = 7
        case Set3 = 14
        case Set4 = 21
        case Set5 = 28
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLabels(questionSet: .Set1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
        gameMode()
    }
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: false)
        checkAnswer()
        changeTextFieldEnableStatus(enable: false)
    }
    
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
        newGame()
    }
    
    @IBAction func submitAnswerBtnPressed(_ sender: UIButton) {
        checkAnswer()
        changeTextFieldEnableStatus(enable: false)
        nextQuestionBtn.isHidden = false
        if progress == 5 {
            nextQuestionBtn.isHidden = true
            showAlert()
        }
    }
    @IBAction func nextQuestionBtnPressed(_ sender: UIButton) {
        print("progress: \(progress)")
        if progress < 5 {
            initLabels(questionSet: selectNextQuestion())
            nextQuestionBtn.isHidden = true
            resetTextFields()
            progress += 1
            updateGameProgress(value: progress)
            gameMode()
        }
        
    }
    func initLabels(questionSet: QuestionSet) {
        counter = questionSet.rawValue
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
    
    func selectNextQuestion() -> QuestionSet {
        switch counter {
        case 0...6:
            return QuestionSet.Set1
        case 7...13:
            return QuestionSet.Set2
        case 14...20:
            return QuestionSet.Set3
        case 21...27:
            return QuestionSet.Set4
        case 28...34:
            return QuestionSet.Set5
        default:
            return QuestionSet.Set1
        }
    }
    
    func updateGameProgress(value: Int) {
        progressLabel.text = "\(value)/5"
    }
    
    func showAlert() {
        let alertController = UIAlertController(
            title:"Game finished",message:"Congratulations! You have completed the game",preferredStyle:UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction( title:"Cancel",style:UIAlertActionStyle.cancel, handler:nil)
        let restartAction = UIAlertAction( title:"Play Again",style:UIAlertActionStyle.default){ (uiAlertAction) in
            self.newGame()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(restartAction)
        self.present(alertController, animated: true, completion:nil)
    }
    
    func newGame() {
        progress = 1
        updateGameProgress(value: progress)
        initLabels(questionSet: .Set1)
        changeLabelHiddenStatus(hidden: false)
        resetTextFields()
        startGameButton.isHidden = false
        changeTextFieldEnableStatus(enable: false)
        changeButtonCollectionHiddenStatus(hidden: true)
    }
    
    func gameMode() {
        changeLabelHiddenStatus(hidden: true)
        startGameButton.isHidden = true
        changeTextFieldEnableStatus(enable: true)
        changeButtonCollectionHiddenStatus(hidden: false)
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
    
    func changeButtonCollectionHiddenStatus(hidden: Bool) {
        for button in gameStartButtonCollection {
            button.isHidden = hidden
        }
    }
}

