//
//  MenuViewController.swift
//  Components
//
//  Created by Arslan Zagidullin on 30/04/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate {
    
    struct Notifications {
        static let MainSelected = "MainSelected"
        static let RedSelected = "RedSelected"
        static let GreenSelected = "GreenSelected"
    }
    
    @IBAction func mainButtonTapped(sender: AnyObject) {
        let center = NSNotificationCenter.defaultCenter()
        center.postNotification(NSNotification(name: Notifications.MainSelected, object: self))
    }
    @IBAction func redButtonTapped(sender: AnyObject) {
        let center = NSNotificationCenter.defaultCenter()
        center.postNotification(NSNotification(name: Notifications.RedSelected, object: self))
    }
    @IBAction func greenButtonTapped(sender: AnyObject) {
        let center = NSNotificationCenter.defaultCenter()
        center.postNotification(NSNotification(name: Notifications.GreenSelected, object: self))
    }
}
