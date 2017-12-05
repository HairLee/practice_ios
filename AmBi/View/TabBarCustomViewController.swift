//
//  TabBarCustomViewController.swift
//  AmBi
//
//  Created by Dreamup on 10/27/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit

class TabBarCustomViewController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        
        
        let tabViewController1 = LoginViewController(
            nibName: "LoginViewController",
            bundle: nil)
        let tabViewController2 = MapViewController(
            nibName:"MapViewController",
            bundle: nil)
        let tabViewController3 = SocialMediaViewController(
            nibName:"SocialMediaViewController",
            bundle: nil)
        
        let tabViewController4 = SettingViewController(
            nibName:"SettingViewController",
            bundle: nil)
        
        
        
        let nav1 = UINavigationController.init(rootViewController: tabViewController1)
        let nav2 = UINavigationController.init(rootViewController: tabViewController2)
        
        let nav3 = UINavigationController.init(rootViewController: tabViewController3)
        let nav4 = UINavigationController.init(rootViewController: tabViewController4)
        
        
        let controllers = [nav1,nav2,nav3,nav4]
        self.viewControllers = controllers
        
//                self.tabBar.barTintColor = UIColor.blue
        
        self.tabBar.tintColor = UIColor.blue
        
        tabViewController1.tabBarItem = UITabBarItem(
            title: "Chat",
            image: UIImage(named: "dalo_chat_icon_40"),
            tag: 1)
//        tabViewController1.tabBarItem.imageInsets = UIEdgeInsets(top:6 , left: 0, bottom: -9, right: 0)
       
        
        
        tabViewController2.tabBarItem = UITabBarItem(
            title: "Contact",
            image:UIImage(named: "myinfo2_header") ,
            tag:2)
//        tabViewController2.tabBarItem.imageInsets = UIEdgeInsets(top:9 , left: 0, bottom: -9, right: 0)
        
        
        
        tabViewController3.tabBarItem = UITabBarItem(
            title: "Board",
            image:UIImage(named: "dalo_chat_icon_40") ,
            tag:2)
//        tabViewController3.tabBarItem.imageInsets = UIEdgeInsets(top:8 , left: 0, bottom: -9, right: 0)
        
        
        
        tabViewController4.tabBarItem = UITabBarItem(
            title: "Setting",
            image:UIImage(named: "dalo_chat_icon_40") ,
            tag:2)
//        tabViewController4.tabBarItem.imageInsets = UIEdgeInsets(top:8 , left: 0, bottom: -9, right: 0)
       
        
        
        
    }
    
    
}
