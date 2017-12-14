//
//  CheckBoxCustom.swift
//  AmBi
//
//  Created by Dreamup on 12/12/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class CheckBoxCustom: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox(isChecked: false)
    }

    func checkBox(isChecked:Bool){
        if isChecked {
            self.image = UIImage.init(named: "ava")
        } else {
            self.image = UIImage.init(named: "dalo_search_icon")
        }
    }
}
