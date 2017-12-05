//
//  BaseHeaderUIView.swift
//  AmBi
//
//  Created by Dreamup on 10/24/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class BaseHeaderUIView: UIView {


    var view : UIView!

    var backAction: (() -> ())?
    var rightAction: (() -> ())?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        
    }
    
    
    @IBOutlet weak var imvBack: UIImageView!
    @IBOutlet weak var imageTop: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var rightBtn: UIButton!
    func config(title: String, image: String, rightBtnImage: String? = nil)
    {
        lbTitle.text = title
        imvBack.image = UIImage.init(named: image)
        
        
        if let rightImage = rightBtnImage {
            rightBtn.setImage(UIImage.init(named: rightImage), for: .normal)
            rightBtn.isHidden = false
        }
    }

    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.backAction?()
        
    }
    
    
    @IBAction func rightAction(_ sender: Any) {
        
        self.rightAction?()
    }
    
    
    func loadViewFromNib() ->UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BaseHeaderUIView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
