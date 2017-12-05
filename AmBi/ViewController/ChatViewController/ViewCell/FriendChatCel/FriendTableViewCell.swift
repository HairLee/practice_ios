//
//  FriendTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var lbMessage: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    
    @IBOutlet weak var chatView: UIView!
    func bidingData(message:Message){
        
        lbMessage.text = message.messageContent
        lbTime.text = message.timeMessage
        chatView.layer.cornerRadius = 10
        //        chatView.layer.borderWidth = 1
        //        chatView.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}
