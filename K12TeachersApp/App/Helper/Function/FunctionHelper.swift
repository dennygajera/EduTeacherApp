//
//  FunctionHelper.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit


// setting Up segmented UI
 func setSegmentedUI(_ selectedButton: UIButton, _ UnSelectButton: UIButton) {
    selectedButton.setTitleColor(UIColor.segSelectColor, for: [])
    UnSelectButton.setTitleColor(UIColor.segDeSelectedColor, for: [])
    selectedButton.isUserInteractionEnabled = false
    UnSelectButton.isUserInteractionEnabled = true
    selectedButton.titleLabel?.font = UIFont.segmentSelectedFont
    UnSelectButton.titleLabel?.font = UIFont.segmentDeSelectedFont
    selectedButton.addBottomBorderWithColor(color: UIColor.segSelectColor!, width: 2)
    UnSelectButton.addBottomBorderWithColor(color: UIColor.segDeSelectedColor!, width: 2)
}
//MARK:- Attributed Text with different font family
func attributedText(string1:String, string2:String)->NSAttributedString{
    let textAttributesOne = [NSAttributedString.Key.font: UIFont.PoppinsRegular(size: 14)]
    let textAttributesTwo = [NSAttributedString.Key.font: UIFont.PoppinsSemiBold(size: 14)]
    
    let textPartOne = NSMutableAttributedString(string: string1, attributes: textAttributesOne)
    let textPartTwo = NSMutableAttributedString(string: string2, attributes: textAttributesTwo)
    
    let textCombination = NSMutableAttributedString()
    textCombination.append(textPartOne)
    textCombination.append(textPartTwo)
    return textCombination
}
