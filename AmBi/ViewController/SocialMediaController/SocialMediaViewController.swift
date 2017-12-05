//
//  SocialMediaViewController.swift
//  AmBi
//
//  Created by Dreamup on 12/5/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import PagingMenuController


private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    
     private let viewController1 = LoginViewController.init(nibName: "LoginViewController", bundle: nil)
     public let viewController2 = MapViewController.init(nibName: "MapViewController", bundle: nil)
    
    

    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
 
        return [viewController1, viewController2]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2()]
        }
        var backgroundColor: UIColor {
            return UIColor.gray
        }
        var selectedBackgroundColor: UIColor {
            return UIColor.orange
        }
        var focusMode: MenuFocusMode {
            return .none
        }
        
    }
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "FAQ"))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "문의/제안하기"))
        }
    }
}

class SocialMediaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Go to SocialMediaViewController")
        createPage()
        login()
        
  
    }

    func createPage() {
        self.navigationController?.isNavigationBarHidden = true
        let options = PagingMenuOptions()
        options.viewController2.hideBar()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame = self.view.frame
        pagingMenuController.view.frame.origin.y += 20
        pagingMenuController.view.frame.size.height -= 74
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
    
    func login(){
        
        MenuService.login(id: "taean10@gmail.com", password: "1111", completion: { (response) in
            self.getData()
        }) { (error) in
           
        }
        
    }
    
    func getData(){
        
        MenuService.getFavouriteIdeal(completion: { (response) in
     
            
        }) { (error) in
      
            
        }
        
     
    }

}
