//
//  ViewController.swift
//  AmBi
//
//  Created by Dreamup on 10/19/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ProtocolApp {
    
    
    
    var expandList = Set<Int>()
    
    @IBOutlet weak var tbView: UITableView!
    
    struct cellId {
        static let amCell:String = "amCel"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        getData()
        
        tbView.register(UINib.init(nibName: "AmTableViewCell", bundle: nil), forCellReuseIdentifier: cellId.amCell)
        
        
    }
    
    func OnItemClickListener() {
        print("Hihi")
        
        let alertQ = TestDialog.instanceFromNib(content: "Hihi Hehe", image: "store_down_icon")
        alertQ.show()
        //        alertQ.action1 = {
        //
        //        }
        
        
        
        
    }
    
    
    var mCurrentRow = 0;
    func OnItemClickListenerWithRow(isExpand: Bool, indexOfRow: Int) {
        
        
        
        navigationController?.pushViewController(LoginViewController.init(nibName:"LoginViewController", bundle: nil), animated: true)
        
        
        
        
    }
    
    
//    func OnItemClickListenerWithRow(isExpand: Bool, indexOfRow: Int) {
//
//        let alertQ = TestDialog.instanceFromNib(content: "Hihi Hehe", image: "store_down_icon")
//        alertQ.show()
//        alertQ.actionOk = {
//            alertQ.hide()
//            print("Click Ok")
//        }
//
//        if indexOfRow%2 != 0 {
//            return
//        }
//
//        mCurrentRow = indexOfRow
//        if isExpand {
//
//            expandList.insert(indexOfRow+1)
//
//        } else {
//
//            expandList.remove(indexOfRow+1)
//        }
//
//        print("Hihi \(indexOfRow) \(isExpand) \(expandList.count)")
//
//        tbView.reloadData()
//
//
//
//        Preferences.setAccessToken("Hailpt" + String(indexOfRow))
//
//
//        print("Data == " + Preferences.getAccessToken())
//    }
    
    func getData(){
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if expandList.contains(indexPath.row) {
            return 0
            
        }
        
        return tableView.frame.width/6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId.amCell, for: indexPath) as! AmTableViewCell
        
        if indexPath.row%2 == 0 {
            cell.changeColorOfName(isChange:true)
            cell.backgroundColor = UIColor.cyan
        } else {
            cell.changeColorOfName(isChange:false)
            cell.backgroundColor = UIColor.orange
        }
        
        
        
        cell.bidingData(name: "hailpt " + String(indexPath.row), indexOfRow:indexPath.row, isExpand: expandList.contains(indexPath.row+1))
        
        cell.delegate = self
        return cell
        
    }
    
    
    
    
    
}

