//
//  AritmeticaViewController.swift
//  matematicas
//
//  Created by Luis Flores on 11/9/14.
//  Copyright (c) 2014 Luis Flores. All rights reserved.
//

import UIKit

enum ArithmeticOperation: Int {
    case Addition = 0
    case Substraction
    case Multiplication
    case Division
}

enum LabelOption: Int {
    case First = 0
    case Second
    case Third
    case Fourth
}

class AritmeticaViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstOptionLabel: UILabel!
    @IBOutlet weak var secondOptionLabel: UILabel!
    @IBOutlet weak var thirdOptionLabel: UILabel!
    @IBOutlet weak var fourthOptionLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    var solution: Int!
    var optionSolution: LabelOption!
    var counter = 1
    var accepted = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Aritmética"
        self.generateQuestion()
    }
    
    @IBAction func firstButtonPressed(sender: AnyObject) {
        if (self.optionSolution == .First) {
            self.accepted++
        }

        self.generateQuestion()
    }
    
    @IBAction func secondButtonPressed(sender: AnyObject) {
        if (self.optionSolution == .Second) {
            self.accepted++
        }

        self.generateQuestion()
    }
    
    @IBAction func thirdButtonPressed(sender: AnyObject) {
        if (self.optionSolution == .Third) {
            self.accepted++
        }

        self.generateQuestion()
    }
    
    @IBAction func fourthButtonPressed(sender: AnyObject) {
        if (self.optionSolution == .Fourth) {
            self.accepted++
        }

        self.generateQuestion()
    }

    func generateQuestion() {
        if (self.counter == 10) {
            self.firstOptionLabel.hidden = true
            self.secondOptionLabel.hidden = true
            self.thirdOptionLabel.hidden = true
            self.fourthOptionLabel.hidden = true
            self.resultsLabel.hidden = false
            self.resultsLabel.text = "\(self.accepted) / 10"
        }
        
        self.counterLabel.text = "\(self.counter++) / 10"
        let numberOne = Int(arc4random_uniform(9)) + 1
        let numberTwo = Int(arc4random_uniform(9)) + 1
        let arithmeticOperation = ArithmeticOperation(rawValue: Int(arc4random_uniform(4)))
        
        switch arithmeticOperation! {
        case .Addition:
            self.addition(numberOne, numberTwo: numberTwo)
        case .Substraction:
            self.substraction(numberOne, numberTwo: numberTwo)
        case .Multiplication:
            self.multiplication(numberOne, numberTwo: numberTwo)
        case .Division:
            self.division(numberOne, numberTwo: numberTwo)
        }
    }
    
    func addition(numberOne: Int, numberTwo: Int) {
        self.questionLabel.text = "\(numberOne) + \(numberTwo)"
        self.solution = numberOne + numberTwo
        self.generateOptions()
    }
    
    func substraction(numberOne: Int, numberTwo: Int) {
        self.questionLabel.text = "\(numberOne) - \(numberTwo)"
        self.solution = numberOne - numberTwo
        self.generateOptions()
    }
    
    func multiplication(numberOne: Int, numberTwo: Int) {
        self.questionLabel.text = "\(numberOne) x \(numberTwo)"
        self.solution = numberOne * numberTwo
        self.generateOptions()
    }
    
    func division(numberOne: Int, numberTwo: Int) {
        self.questionLabel.text = "\(numberOne) / \(numberTwo)"
        // TODO: Check valid gcd
        self.solution = numberOne / numberTwo
        self.generateOptions()
    }
    
    func generateOptions() {
        println(self.solution)
        self.optionSolution = LabelOption(rawValue: Int(arc4random_uniform(4)))

        let randomOne = Int(arc4random_uniform(10)) + 1
        let randomTwo = Int(arc4random_uniform(10)) + 1
        let randomThree = Int(arc4random_uniform(10)) + 1

        switch self.optionSolution! {
        case .First:
            self.populateLabels(self.solution,
                                numberTwo: self.solution + randomOne,
                                numberThree: self.solution - randomTwo,
                                numberFour: self.solution + randomThree)
        case .Second:
            self.populateLabels(self.solution + randomOne,
                                numberTwo: self.solution,
                                numberThree: self.solution - randomTwo,
                                numberFour: self.solution + randomThree)
        case .Third:
            self.populateLabels(self.solution - randomOne,
                                numberTwo: self.solution + randomTwo,
                                numberThree: self.solution,
                                numberFour: self.solution - randomThree)
        case .Fourth:
            self.populateLabels(self.solution + randomOne,
                                numberTwo: self.solution - randomTwo,
                                numberThree: self.solution + randomThree,
                                numberFour: self.solution)
        }
    }

    func populateLabels(numberOne:Int, numberTwo:Int, numberThree:Int, numberFour:Int) {
        self.firstOptionLabel.text = "\(numberOne)"
        self.secondOptionLabel.text = "\(numberTwo)"
        self.thirdOptionLabel.text = "\(numberThree)"
        self.fourthOptionLabel.text = "\(numberFour)"
    }
}
