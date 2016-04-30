//
//  ButtonWithLeftmostIcon.swift
//  AutoLayoutStudy
//
//  Created by Arslan Zagidullin on 20/03/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class ButtonWithLeftmostIcon: UIButton {
    
    let iconImageView: UIImageView
    let customTitleLabel: UILabel
    var iconImage: UIImage! {
        didSet {
            iconImageView.image = iconImage.imageWithRenderingMode(.AlwaysTemplate)
        }
    }
    let fgColorNormal = UIColor(red: 47/255.0, green: 86/255.0, blue: 100/255.0, alpha: 1)
    let fgColorPressed = UIColor.whiteColor()
    
    let animationDuration = 0.2
    
    required init?(coder aDecoder: NSCoder) {
        iconImageView = UIImageView(frame: CGRectMake(0, 0, 21, 21))
        customTitleLabel = UILabel()
        
        super.init(coder: aDecoder)
        
        setBackgroundImage(UIImage(named:"Button Pressed"), forState: UIControlState.Highlighted)
        
        iconImageView.center = CGPointMake(22, 22)
        iconImageView.tintColor = fgColorNormal
        addSubview(iconImageView)
        
        if let defaultTitleLabel = titleLabel {
            if let titleText = titleForState(.Normal) {

                customTitleLabel.text = titleText
                let textSize = CGSizeMake(200, 20)
                let textOrigin = CGPointMake(defaultTitleLabel.frame.origin.x - textSize.width/2, defaultTitleLabel.frame.origin.y - textSize.height/2)
                customTitleLabel.frame = CGRectMake(textOrigin.x, textOrigin.y, textSize.width, textSize.height)
                customTitleLabel.textColor = fgColorNormal
                customTitleLabel.font = defaultTitleLabel.font
                customTitleLabel.textAlignment = .Center
                
                self.setTitle("", forState: .Normal)
            }
        }
        addSubview(customTitleLabel)
        
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        let views = ["label": customTitleLabel]
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[label]-|", options: .AlignAllTop, metrics: nil, views: views))
        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[label]-|", options: .AlignAllTop, metrics: nil, views: views))
        
//        let views = ["myView" : myView]
//        let formatString = "|-[myView]-|"
//        
//        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(formatString, options:.AlignAllTop , metrics: nil, views: views)
//        
//        NSLayoutConstraint.activateConstraints(constraints)
        
        addTarget(self, action: #selector(ButtonWithLeftmostIcon.buttonDown), forControlEvents: .TouchDown)
        addTarget(self, action: #selector(ButtonWithLeftmostIcon.buttonUp), forControlEvents: .TouchUpInside)
    }
    
    func buttonDown() {
        UIView.animateWithDuration(animationDuration, animations: {()
            self.iconImageView.tintColor = self.fgColorPressed
        })
        UIView.transitionWithView(self.customTitleLabel, duration: animationDuration, options: .TransitionCrossDissolve, animations: {()
                self.customTitleLabel.textColor = self.fgColorPressed
            }, completion: nil)
        
        self.iconImageView.transform = CGAffineTransformIdentity
        UIView.animateKeyframesWithDuration(animationDuration, delay: 0,
            options: UIViewKeyframeAnimationOptions.CalculationModePaced, animations: {()
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)/8 * (-1))
                })
        }, completion:  nil)
    }
    
    func buttonUp() {
        UIView.animateWithDuration(animationDuration, animations: {()
            self.iconImageView.tintColor = self.fgColorNormal
        })
        UIView.transitionWithView(self.customTitleLabel, duration: animationDuration, options: .TransitionCrossDissolve, animations: {()
                self.customTitleLabel.textColor = self.fgColorNormal
            }, completion: nil)
        UIView.animateKeyframesWithDuration(animationDuration*3, delay: 0,
            options: UIViewKeyframeAnimationOptions.CalculationModePaced, animations: {()
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)*2/3 * 1)
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)*2/3 * 2)
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)*2/3 * 3)
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI)/8 * 1)
                })
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {()
                    self.iconImageView.transform = CGAffineTransformMakeRotation(0)
                })
            }, completion: nil)
    }
    
}
