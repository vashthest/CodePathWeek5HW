//
//  ComposeViewController.swift
//  CodePathWeek5HW
//
//  Created by Yi on 9/7/14.
//  Copyright (c) 2014 Dropbox. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var buttons: [UIButton]!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [textButton, photoButton, quoteButton, linkButton, chatButton, videoButton]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.view.alpha = 0
        for button in buttons {
            button.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
        }
        dismissButton.transform = CGAffineTransformMakeTranslation(0, dismissButton.frame.height)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3, animations: {
            self.view.alpha = 1
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.3, animations: {
                    self.dismissButton.transform = CGAffineTransformIdentity
                })
                for (index, button) in enumerate(self.buttons) {
                    var delay = NSTimeInterval(CGFloat(index) / 60)
                    UIView.animateWithDuration(0.3, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 4, options: nil, animations: {
                            button.transform = CGAffineTransformIdentity
                        }) { (finished: Bool) -> Void in
                    }
                }
        }
    }
    
    @IBAction func onDismissTouch(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.dismissButton.transform = CGAffineTransformMakeTranslation(0, self.dismissButton.frame.height)
        })
        for (index, button) in enumerate(self.buttons) {
            var delay = NSTimeInterval(CGFloat(index) / 60)
            UIView.animateWithDuration(0.3, delay: delay, options: nil, animations: {
                button.transform = CGAffineTransformMakeTranslation(0, -self.view.frame.height)
                }) { (finished: Bool) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
