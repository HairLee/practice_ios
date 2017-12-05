//
//  AmTableViewCell.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class AmTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var btnOk: UIButton!
    var delegate:ProtocolApp?
    
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var mIndexOfRow:Int?
    var mIsExpand:Bool = false
    func bidingData(name:String, indexOfRow:Int, isExpand:Bool){
        mIndexOfRow = indexOfRow
        lbName.text = name
        
//        btnOk.layer.cornerRadius = 22.5
//        btnOk.layer.borderWidth = 1
//        btnOk.layer.borderColor = UIColor.blue.cgColor
        
        mIsExpand = !isExpand
    }
    
    func  changeColorOfName(isChange:Bool) {
        //        if isChange {
        //            lbName.font = lbName.font.withSize(30)
        //
        //        } else {
        //          lbName.font = lbName.font.withSize(15)
        //        }
    }
    
    @IBAction func btnOkAction(_ sender: Any) {
        
        delegate?.OnItemClickListenerWithRow(isExpand:mIsExpand,indexOfRow: mIndexOfRow!)
        
    }
}
