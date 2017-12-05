//
//  FirstTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var lnNameOfRoom: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bidingData(pRoom:Room){
        
        lnNameOfRoom.text = pRoom.nameOfRoom
        
    }
    
}
