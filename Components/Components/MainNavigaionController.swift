//
//  MainNavigaionController.swift
//  Components
//
//  Created by Arslan Zagidullin on 30/04/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class MainNavigaionController: UINavigationController {
    
    private var mainSelectedObserver: NSObjectProtocol?
    private var redSelectedObserver: NSObjectProtocol?
    private var greenSelectedObserver: NSObjectProtocol?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    private func addObservers() {
        let center = NSNotificationCenter.defaultCenter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        mainSelectedObserver =
            center.addObserverForName(MenuViewController.Notifications.MainSelected, object: nil, queue: nil) { (notification: NSNotification!) in
            
                let mvc = storyboard.instantiateViewControllerWithIdentifier("MainViewController")
                self.setViewControllers([mvc], animated: true)
        }
        redSelectedObserver =
            center.addObserverForName(MenuViewController.Notifications.RedSelected, object: nil, queue: nil) { (notification: NSNotification!) in
            
                let rvc = storyboard.instantiateViewControllerWithIdentifier("RedViewController")
                self.setViewControllers([rvc], animated: true)
        }
        greenSelectedObserver =
            center.addObserverForName(MenuViewController.Notifications.GreenSelected, object: nil, queue: nil) { (notification: NSNotification!) in
                
                let gvc = storyboard.instantiateViewControllerWithIdentifier("GreenViewController")
                self.setViewControllers([gvc], animated: true)
        }
    }
    
    private func removeObservers() {
        let center = NSNotificationCenter.defaultCenter()
        
        if mainSelectedObserver != nil {
            center.removeObserver(mainSelectedObserver!)
        }
        if redSelectedObserver != nil {
            center.removeObserver(redSelectedObserver!)
        }
        if greenSelectedObserver != nil {
            center.removeObserver(greenSelectedObserver!)
        }
    }
}
