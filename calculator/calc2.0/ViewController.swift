//
//  ViewController.swift
//  calc2.0
//
//  Created by Illya Kuzmenko on 4/10/18.
//  Copyright © 2018 Illya Kuzmenko. All rights reserved.
//

import UIKit

enum Operation:String
{
    case Add = "+";
    case Subtract = "-";
    case Divide = "/";
    case Multiply = "*";
    case NULL = "Null";
}

class ViewController: UIViewController
{

    
    override var preferredStatusBarStyle : UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent //white status bar
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func numberPressed(_ sender: RoundButton)
    {
        if runningNumber.count <= 8
        {
            runningNumber += "\(sender.tag)"
            outputLbl.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton)
    {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    @IBAction func dotPressed(_ sender: RoundButton)
    {
        if runningNumber.count <= 7
        {
            runningNumber += "."
            outputLbl.text = runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton)
    {
        Operation(Operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton)
    {
        Operation(Operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: RoundButton)
    {
        Operation(Operation: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton)
    {
        Operation(Operation: .Multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton)
    {
        Operation(Operation: .Divide)
    }
    func Operation(Operation: Operation)
    {
        if currentOperation != .NULL
        {
            if runningNumber != ""
            {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add
                {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }
                else if currentOperation == .Subtract
                {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }
                else if currentOperation == .Multiply
                {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                else if currentOperation == .Divide
                {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0)
                {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = Operation
        }
        else
        {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = Operation
        }
    }
}

