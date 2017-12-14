//
//  LoginViewController.swift
//  AmBi
//
//  Created by Dreamup on 10/24/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import  RealmSwift
class LoginViewController: BaseViewController {
    
    
    struct cellID {
        static let cellChatList = "cellChatList"
    }
    
    
    
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var  navigatiovarew: BaseHeaderUIView!
    
    var searchView = SearchSubview()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushData), name:  Notification.Name(rawValue: "tabVc"), object: nil)
    }
    
    @objc func pushData(){
        
        print("kkkk")
      let dialog =   TestDialog.instanceFromNib(content: "11", image: "")
        dialog.show()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         makeLayout()
        mSearhRooms = mSearhRooms.sorted{$0.timeStamp > $1.timeStamp}
        tbView.reloadData()
        tbView.scrollsToTop = true
    }
    
    override func doAutoLogin() {
        
        let currentTime = CACurrentMediaTime()
        
        print("Time == \(currentTime)")
        
        //        navigatiovarew.backAction = {
        //            self.navigationController?.popViewController(animated: true)
        //
        //        }
        
    }
    
    
    func setupUI(){
        tbView.delegate = self
        tbView.dataSource = self
        tbView.register(UINib.init(nibName: "ListChatTableViewCell", bundle: nil), forCellReuseIdentifier: cellID.cellChatList)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.setToolbarHidden(true, animated: true)
        //        self.tabBarController?.tabBar.tintColor = UIColor.brown
        
    }
    
    var mRooms = [Room]()
    var mSearhRooms = [Room]()
    var nameOfRooms = ["Kim Tea He","Kim Bum","Dragon","Yonah","Bag Young Yon","Park","Supper T","Dea Un","Kim Yong Un","Dea Jang Kum","Jack Ma","",""]
    func getData(){
        
        
        let realm = try! Realm()
        
        let rooms = realm.objects(Room.self).filter("id > 0")
        
        
        
        print("mRooms = \(mRooms.count)")
        
        if rooms.count > 0 {
            
            for i in 0 ... rooms.count-1 {
                
                let room = rooms[i]
                mRooms.append(room)
            }
            
            mSearhRooms = mRooms
            mSearhRooms = mSearhRooms.sorted{$0.timeStamp > $1.timeStamp}
            
            tbView.reloadData()
            return
        }
        
        let mMessageList = List<Message>()
        for j in 1 ... 2 {
            let message = Message()
            message.idMessageOfAuthor = j
            message.messageContent = "Hello I'm Ambi, What is your name?"
            message.timeMessage = "20:10"
            
            mMessageList.append(message)
            
        }
        
        print("mMessageList = \(mMessageList.count)")
        
        try! realm.write {
            for i in 1 ... 10 {
                
                let room = Room()
                room.id = i
                room.messageList = mMessageList
                room.nameOfRoom = nameOfRooms[i]
                room.timeStamp =  CACurrentMediaTime()
                realm.add(room)
            }
            
        }
        mSearhRooms = mRooms
        print("Rooms = \(rooms.count)")
        tbView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(_ sender: Any) {
        navigationController?.pushViewController(ChatViewController.init(nibName:"ChatViewController", bundle: nil), animated: true)
    }
    
    
    @IBOutlet weak var edittingSearch: UITextField!
    var filterData = [Room]()
    @IBAction func edittingChangeAction(_ sender: Any) {
        
        print("Change !! \(edittingSearch.text)")
        
        let text = edittingSearch.text
        if text == "" {
            mSearhRooms = mRooms
        } else {
            mSearhRooms = mRooms.filter({$0.nameOfRoom.lowercased().contains(text!) })
        }
        
        self.tbView.reloadData()
    }
    
    func makeLayout(){
        
        //     Make a view
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = UIColor.red
        
        //Make a second view
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = UIColor(
            red: 0.75,
            green: 0.75,
            blue: 0.1,
            alpha: 1.0)
        
        
        //Add the views
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    
}


extension LoginViewController:UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mSearhRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID.cellChatList, for: indexPath) as! ListChatTableViewCell
        cell.bidingData(pRoom:mSearhRooms[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let chatViewVC = ChatViewController.init(nibName:"ChatViewController", bundle: nil)
        chatViewVC.roomId = mSearhRooms[indexPath.row].id
        chatViewVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(chatViewVC, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        
        
        
//        self.edittingSearch.becomeFirstResponder()
        
//        let dialog = TestDialog.instanceFromNib(content: "Kaka", image: "ava")
//        dialog.show()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {

        print("Dimen  == \(scrollView.contentOffset.y)")
        
        if scrollView.contentOffset.y < -100 {
            
                self.edittingSearch.becomeFirstResponder()
       
        }
    }
    
    
}
