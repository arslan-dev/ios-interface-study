//
//  ContainerViewController.swift
//  Components
//
//  Created by Arslan Zagidullin on 30/04/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    let leftMenuWidthFull:CGFloat = 230
    let leftMenuWidthMinimized:CGFloat = 80
    
    var leftViewController: UIViewController? {
        willSet {
            if self.leftViewController != nil {
                if self.leftViewController!.view != nil {
                    self.leftViewController!.view!.removeFromSuperview()
                }
                self.leftViewController!.removeFromParentViewController()
            }
        }
        didSet {
            self.view!.addSubview(self.leftViewController!.view)
            let leftViewRect = self.leftViewController!.view.frame
            self.leftViewController!.view.frame = CGRect(
                x: leftViewRect.origin.x,
                y: leftViewRect.origin.y,
                width: self.leftMenuWidthFull,
                height: leftViewRect.size.height)
            self.addChildViewController(self.leftViewController!)
            
            self.leftViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            let views = ["menu": self.leftViewController!.view]
            NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[menu]-|", options: .AlignAllTop, metrics: nil, views: views))
            NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[menu]-|", options: .AlignAllTop, metrics: nil, views: views))
        }
    }
    
    var rightViewController: UIViewController? {
        willSet {
            if self.rightViewController != nil {
                if self.rightViewController!.view != nil {
                    self.rightViewController!.view!.removeFromSuperview()
                }
                self.rightViewController!.removeFromParentViewController()
            }
        }
        didSet {
            self.view!.addSubview(self.rightViewController!.view)
            self.addChildViewController(self.rightViewController!)
        }
    }
    
    var menuShown: Bool = false
    
    @IBAction func swipeRight(sender: UIScreenEdgePanGestureRecognizer) {
        showMenu()
    }
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        hideMenu()
    }
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        var offsetX = sender.locationInView(self.view!).x
        if (offsetX > leftMenuWidthFull) {
            offsetX = leftMenuWidthFull
        } else if (offsetX < leftMenuWidthMinimized) {
            offsetX = leftMenuWidthMinimized
        }
    
        let leftViewRect = self.leftViewController!.view.frame
        self.leftViewController!.view.frame = CGRect(
            x: -leftMenuWidthFull + offsetX,
            y: leftViewRect.origin.y,
            width: leftViewRect.width,
            height: leftViewRect.height
        )
    }
    
    func showMenu() {
        UIView.animateWithDuration(0.3, animations: {
            self.rightViewController!.view.frame = CGRect(
                x: self.view.frame.origin.x + self.leftMenuWidthFull,
                y: self.view.frame.origin.y,
                width: self.view.frame.width,
                height: self.view.frame.height
            )}, completion: { (Bool) -> Void in
                    self.menuShown = true
        })
    }
    
    func hideMenu() {
        UIView.animateWithDuration(0.3, animations: {
            self.rightViewController!.view.frame = CGRect(
                x: 0,
                y: self.view.frame.origin.y,
                width: self.view.frame.width,
                height: self.view.frame.height
            )}, completion: { (Bool) -> Void in
                self.menuShown = false
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNavigaionController: UINavigationController = storyboard.instantiateViewControllerWithIdentifier("MainNavigationController") as! UINavigationController
        let menuViewController: MenuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        
        self.rightViewController = mainNavigaionController
        self.leftViewController = menuViewController
    }
}
