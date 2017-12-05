//
//  UIButtonRadius.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class UIButtonRadius: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        changeState(isActive: false)
        
        
    }
    
    func changeState(isActive: Bool) {
        if isActive {
            self.setTitleColor(buttonActiveColor, for: .normal)
            self.borderColor = buttonActiveColor
            self.isUserInteractionEnabled = true
        } else {
            self.setTitleColor(buttonInActiveColor, for: .normal)
            self.borderColor = buttonInActiveColor
            self.isUserInteractionEnabled = false
        }
    }
}


