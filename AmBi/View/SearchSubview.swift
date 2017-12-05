//
//  SearchSubview.swift
//  AmBi
//
//  Created by Dreamup on 11/1/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class SearchSubview: UIView {
    
    
    var label = UILabel()
    var container = UIView()
    
    override func awakeFromNib() {
        container = UIView(frame : CGRect(x:0, y:0, width:200, height: 200))
        
        label.text = "Hihi"
        container.addSubview(label)
        self.addSubview(container)
    }


}
