//
//  ProtocolApp.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

protocol ProtocolApp {
    func OnItemClickListener()
    func OnItemClickListenerWithRow(isExpand:Bool,indexOfRow:Int)
}
