//
//  DynamicStackViewController.swift
//  AutoLayoutStudy
//
//  Created by Arslan Zagidullin on 24/03/16.
//  Copyright © 2016 Arslan Zagidullin. All rights reserved.
//

import UIKit

class DynamicStackViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup scrollview
        let insets = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addEntry(sender: AnyObject) {
        let stack = stackView
        let index = stack.arrangedSubviews.count-1
        let addView = stack.arrangedSubviews[index]
        
        let scroll = scrollView
        let offset = CGPoint(x: scroll.contentOffset.x,
                             y: scroll.contentOffset.y + addView.frame.size.height)
        
        let newView = createEntry()
        newView.hidden = true
        stack.insertArrangedSubview(newView, atIndex: index)
        
        UIView.animateWithDuration(0.25) { () -> Void in
            newView.hidden = false
            scroll.contentOffset = offset
        }
    }
    
    func deleteStackView(sender: UIButton) {
        if let view = sender.superview {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                view.hidden = true
                }, completion: { (success) -> Void in
                    view.removeFromSuperview()
            })
        }
    }
    
// MARK: - Private Methods
    private func createEntry() -> UIView {
        let stack = UIStackView()
        stack.axis = .Horizontal
        stack.alignment = .FirstBaseline
        stack.distribution = .Fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        dateLabel.setContentHuggingPriority(251, forAxis: .Horizontal)
        dateLabel.setContentCompressionResistancePriority(750, forAxis: .Horizontal)
        
        let numberLabel = UILabel()
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        numberLabel.setContentHuggingPriority(250, forAxis: .Horizontal)
        numberLabel.setContentCompressionResistancePriority(751, forAxis: .Horizontal)
        
        let deleteButton = UIButton(type: .RoundedRect)
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.addTarget(self, action: #selector(DynamicStackViewController.deleteStackView(_:)), forControlEvents: .TouchUpInside)
        deleteButton.setContentHuggingPriority(251, forAxis: .Horizontal)
        deleteButton.setContentCompressionResistancePriority(750, forAxis: .Horizontal)
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }

    private func randomHexQuad() -> String {
        return NSString (format: "%X%X%X%X",
        arc4random() % 16,
        arc4random() % 16,
        arc4random() % 16,
        arc4random() % 16
        ) as String
    }
}
