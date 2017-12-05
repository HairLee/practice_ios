//
//  ChatViewController.swift
//  AmBi
//
//  Created by Dreamup on 10/24/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation
class ChatViewController: BaseViewController {
    
    
    
    
    @IBOutlet weak var navigationView: BaseHeaderUIView!
    
    @IBOutlet weak var tbView: UITableView!
    
    @IBOutlet weak var tfChat: UITextField!
    
    
    struct cellID {
        static let chatCell = "chatCell"
        static let firstTimeChatCell = "firstTimeChatCell"
        static let friendChatCell = "friendChatCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func getCurrentTime() -> String {
    
    
       
        
        
        let cerrentTime = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: cerrentTime)
        let min = calendar.component(.minute, from: cerrentTime)
        
        let time = "\(hour):\(min)"
        
        return time
    }
    
    var cellArr:[UITableViewCell] = []
    func setupUI(){
        tbView.delegate = self
        tbView.dataSource = self
        navigationView.config(title: mRoom.nameOfRoom, image: "back_icon")
        
        
        
        tbView.register(UINib.init(nibName: "FriendTableViewCell", bundle: nil), forCellReuseIdentifier: cellID.friendChatCell)
        tbView.register(UINib.init(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: cellID.chatCell)
        tbView.register(UINib.init(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: cellID.firstTimeChatCell)
        
        
        
        
        
        tbView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(handleTap)))
        
        let message = Message()
        message.idMessageOfAuthor = mId
        message.messageContent = tfChat.text!
        
        mMessages.append(message)
        
        
    }
    
    @objc func handleTap(){
        self.view.endEditing(true)
        
    }
    
    var roomId = 2
    var mMessages = List<Message>()
    var mRoom = Room()
    func getData(){
        
        let realm = try! Realm()
        let rooms = realm.objects(Room.self).filter("id = \(roomId)")
        mRoom = rooms[0]
        mMessages = mRoom.messageList
        tbView.reloadData()
        
        
        let row = [IndexPath.init(row: mMessages.count-1, section: 0)]
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            self.tbView.scrollToRow(at: row[0], at: .bottom, animated: true)
        }
        
    }
    
    override func doAutoLogin() {
        
        navigationView.backAction = {
            self.navigationController?.popViewController(animated: true)
            
            
            
        }
        
    }
    
    
    @IBAction func btnMapAction(_ sender: Any) {
        
        navigationController?.pushViewController(MapViewController.init(nibName: "MapViewController", bundle:nil), animated: true)
    }
    
    var mId = 1
    @IBAction func btnChatEnter(_ sender: Any) {
        if tfChat.text == "" {
            
            
        } else {
            
            if mMessages.count%2 == 0 {
                mId = 1
            } else {
                mId = 2
            }
            
            let message = Message()
            message.idMessageOfAuthor = mId
            message.messageContent = tfChat.text!
            message.timeMessage = getCurrentTime()
            
            
            
            
            
            let realm = try! Realm()
            try! realm.write {
                
                mMessages.append(message)
                
//                 mMessages.sorted(by: { $0.timeMessage > $1.timeMessage})
//                
//                mMessages.sorted(by: { (date1., date2) -> Bool in
//                    
//                mMessages.sorted(by: { $0.timeMessage > $1.timeMessage})
//                    
//                })
                
                mRoom.messageList = mMessages
                mRoom.timeStamp =  CACurrentMediaTime()
                
                
      
                
                
            }
            
            let row = [IndexPath.init(row: mMessages.count-1, section: 0)]
            tbView.beginUpdates()
            tbView.insertRows(at: row, with: .bottom)
            tbView.endUpdates()
            tfChat.text = ""
            
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
                self.tbView.scrollToRow(at: row[0], at: .bottom, animated: false)
            }
            
        }
        
        
    }
    
    
}
extension ChatViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID.firstTimeChatCell, for: indexPath) as! FirstTableViewCell
            cell.bidingData(pRoom: mRoom)
            
            return cell
            
        } else {
            if mMessages[indexPath.row].idMessageOfAuthor == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: cellID.chatCell, for: indexPath) as! ChatTableViewCell
                cell.bidingData(message: mMessages[indexPath.row])
                return cell
            } else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: cellID.friendChatCell, for: indexPath) as! FriendTableViewCell
                cell.bidingData(message: mMessages[indexPath.row])
                return cell
            }
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //        self.navigationController?.pushViewController(ChatDetailViewController.init(), animated: true)
        
    }
    
    
    
}
















