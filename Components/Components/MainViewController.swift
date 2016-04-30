//
//  MainViewController.swift
//  Components
//
//  Created by Arslan Zagidullin on 30/04/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var art: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        art.image = art.image!.imageWithRenderingMode(.AlwaysTemplate)
    }
}
