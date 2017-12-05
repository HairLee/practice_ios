//
//  TestDialog.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit



class TestDialog:PopupView {

    var actionOk: (() -> ())?
    

    @IBOutlet weak var lbTitle: UILabel!
    class func instanceFromNib(content: String, image : String) -> TestDialog {
        let joinView = UINib(nibName: "TestDialog", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TestDialog
        joinView.lbTitle.text = content
//        joinView.imageMain.image = UIImage.init(named: image)
        
        joinView.animationType = .upDown
//        joinView.popupFrame = CGRect.init(x: 20, y: (SCREEN_HEIGHT - 380)/2, width: SCREEN_WIDTH-60, height: 280)
//                joinView.popupFrame = CGRect.init(x: 20, y: SCREEN_HEIGHT/4, width: SCREEN_WIDTH-40, height: SCREEN_HEIGHT/2)
        
                joinView.popupFrame = CGRect.init(x: 0, y: SCREEN_HEIGHT/3, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*2/3)
        
        
        joinView.layer.cornerRadius = 0
        joinView.clipsToBounds = true
        return joinView
    }
    
    @IBAction func btnOK(_ sender: Any) {
        if let action = actionOk {
            action()
        }
        
    }
    
    @IBOutlet weak var btnOkAction: UIButton!
}
