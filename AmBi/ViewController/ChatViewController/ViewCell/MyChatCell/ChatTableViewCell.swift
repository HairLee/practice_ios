//
//  ChatTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/24/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rootView: UIView!
    
    @IBOutlet weak var chatView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    func setupUI(){
        
    }
    

    
    @IBOutlet weak var lbMessage: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    func bidingData(message:Message){
        
        lbMessage.text = message.messageContent
        lbTime.text = message.timeMessage
        chatView.layer.cornerRadius = 10
//        chatView.layer.borderWidth = 1
//        chatView.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}
