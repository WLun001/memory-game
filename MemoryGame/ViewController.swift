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
    @IBOutlet weak var wordLabel1: UILabel!
    @IBOutlet weak var wordLabel2: UILabel!
    @IBOutlet weak var wordLabel3: UILabel!
    @IBOutlet weak var wordLabel4: UILabel!
    @IBOutlet weak var wordLabel5: UILabel!
    @IBOutlet weak var wordLabel6: UILabel!
    @IBOutlet weak var wordLabel7: UILabel!
    
    private let words = Words().words
    private var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labels.append(wordLabel1)
        labels.append(wordLabel2)
        labels.append(wordLabel3)
        labels.append(wordLabel4)
        labels.append(wordLabel5)
        labels.append(wordLabel6)
        labels.append(wordLabel7)
        
        initLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGameBtnPressed(_ sender: UIButton) {
        for label in labels {
            label.isHidden = true
        }
    }
    
    func initLabel() {
        for label in labels {
            label.text = words[counter]
            counter += 1
        }
    }


}

