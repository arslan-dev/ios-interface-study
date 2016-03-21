//
//  ButtonWithLeftmostIcon.swift
//  TestAppDel
//
//  Created by Arslan Zagidullin on 20/03/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class ButtonWithLeftmostIcon: UIButton {
    
    let iconImageView: UIImageView
    var iconImage: UIImage!
    
    required init?(coder aDecoder: NSCoder) {
        iconImageView = UIImageView(frame: CGRectMake(0, 0, 24, 24))
        
        super.init(coder: aDecoder)
        
        iconImageView.image = iconImage
        addSubview(iconImageView)
        print("ADDED!")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.image = iconImage
        iconImageView.frame.origin.x = 12
        /*
        if let title = self.titleLabel {
            title.frame.origin.x = self.frame.width/2 - title.frame.width/2
        }*/
        setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
    }
    
}
