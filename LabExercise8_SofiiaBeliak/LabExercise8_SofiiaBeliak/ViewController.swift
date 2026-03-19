//
//  ViewController.swift
//  LabExercise8_SofiiaBeliak
//
//  Created by Sofiia Beliak on 2026-03-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var stepButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!

    var output = 0
    var step = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "\(output)"
        stepButton.setTitle("Step \(step)", for: .normal)
        logoImageView.image = UIImage(named: "gbc_logo")
    }

    @IBAction func minusButtonTapped(_ sender: UIButton) {
        output -= step
        outputLabel.text = "\(output)"
    }

    @IBAction func plusButtonTapped(_ sender: UIButton) {
        output += step
        outputLabel.text = "\(output)"
    }
   
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        output = 0
        outputLabel.text = "\(output)"
    }
    
    @IBAction func stepButtonTapped(_ sender: UIButton) {
        step = (step == 1) ? 2 : 1
        stepButton.setTitle("Step \(step)", for: .normal)
    }
}

