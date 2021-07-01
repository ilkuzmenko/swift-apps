//
//  RoundButton.swift
//  calc2.0
//
//  Created by Illya Kuzmenko on 4/10/18.
//  Copyright © 2018 Illya Kuzmenko. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton
{
    @IBInspectable var roundButton:Bool = false
    {
        didSet
        {
            if roundButton
            {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder()
    {
        if roundButton
        {
          layer.cornerRadius = frame.height / 2
        }
    }
    
}
