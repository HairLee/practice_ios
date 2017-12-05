//
//  SettingViewController.swift
//  AmBi
//
//  Created by Dreamup on 12/5/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    
    @IBOutlet var imvDetail: UIImageView!
    @IBOutlet var tbView: UITableView!
    
    var arrData = [Int]()
    
    struct cellID {
        static let oneCell = "oneCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
//        pickImage(isLibrary: true)
    }
    
    func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
        tbView.dataSource = self
        tbView.delegate = self
        arrData.append(1)
        arrData.append(1)
        tbView.register(UINib.init(nibName: "OneTableViewCell", bundle: nil), forCellReuseIdentifier: cellID.oneCell)
    }
    
    func pickImage(isLibrary: Bool) {
        let picker = UIImagePickerController()
        picker.sourceType = isLibrary ?  .photoLibrary : .camera
        picker.allowsEditing = false;
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: cellID.oneCell, for: indexPath) as! OneTableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arrData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.pickImage(isLibrary: true)
        case 1:
            self.pickImage(isLibrary: false)
        default:
            break
        }
        
        
        //       arrData.append(1)
        //        tbView.reloadData()
    }
    
}

extension SettingViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image  = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: false) {
                
                self.imvDetail.image = image
            }
        }
        
    }
}
