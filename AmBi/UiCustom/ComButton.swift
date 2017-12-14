//
//  ComButton.swift
//  AmBi
//
//  Created by Dreamup on 12/12/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class ComButton: UIButton {

    override func awakeFromNib() {
      changeState(isActive: false)
    }
    
    func changeState(isActive: Bool, isChangeColor : Bool? = nil) {
        if isActive {
            if let _ = isChangeColor {
            } else {
                self.setTitleColor(buttonActiveColor, for: .normal)
                self.borderColor = buttonInActiveColor
                self.backgroundColor = buttonInActiveColor
                self.cornerRadius = 25
            }
            self.isUserInteractionEnabled = true
        } else {
            if let _ = isChangeColor {
            } else {
                self.setTitleColor(buttonInActiveColor, for: .normal)
                self.borderColor = buttonInActiveColor
                 self.backgroundColor = buttonActiveColor
                 self.cornerRadius = 25
            }
//            self.isUserInteractionEnabled = false
        }
    }

}
