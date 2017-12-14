//
//  DetailImageViewController.swift
//  AmBi
//
//  Created by Dreamup on 12/13/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class DetailImageViewController: BaseViewController {

    @IBOutlet var imvDetail: UIImageView!
    var urlOfImage:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imvDetail.kf.setImage(with: URL(string: urlOfImage))
    }

    @IBAction func btnClose(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
