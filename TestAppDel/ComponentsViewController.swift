//
//  ComponentsViewController.swift
//  TestAppDel
//
//  Created by Arslan Zagidullin on 28/03/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class ComponentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    - (void) displayContentController: (UIViewController*) content {
//    [self addChildViewController:content];
//    content.view.frame = [self frameForContentController];
//    [self.view addSubview:self.currentClientView];
//    [content didMoveToParentViewController:self];
//    }
    
// MARK: - Private Methods
//    func displayContentController(content: UIViewController) {
//        addChildViewController(content)
//        view.addSubview()
//    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        print("Lalka")
    }
}
