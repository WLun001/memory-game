//
//  ViewController.swift
//  MemoryGame
//
//  Created by Wei Lun on 27/06/2018.
//  Copyright © 2018 Wei Lun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labels: [UILabel]!
    
    private let words = Words().words
    private var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: true)
    }
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        changeLabelHiddenStatus(hidden: false)
    }
    
    @IBAction func newGameBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func submitAnswerBtnPressed(_ sender: UIButton) {
    }
    func initLabel() {
        for label in labels {
            label.text = words[counter]
            counter += 1
        }
    }
    
    func changeLabelHiddenStatus(hidden: Bool) {
        for label in labels {
            label.isHidden = hidden
        }
    }


}

