//
//  ListChatTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/27/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class ListChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbNameOfRoom: UILabel!
    
    @IBOutlet weak var lbLastMsg: UILabel!
    
    @IBOutlet weak var lbLastMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bidingData(pRoom:Room){
        lbNameOfRoom.text = pRoom.nameOfRoom
        lbLastMsg.text = pRoom.messageList[pRoom.messageList.count-1].messageContent
    }
    
    
    
    
    
    
}
