//
//  LoginViewController.swift
//  CodePathWeek5HW
//
//  Created by Yi on 9/7/14.
//  Copyright (c) 2014 Dropbox. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        loginView.transform = CGAffineTransformMakeTranslation(0, self.view.frame.height)
    }
    
    override func viewDidAppear(animated: Bool) {
        textField.becomeFirstResponder()
        UIView.animateWithDuration(0.4, animations: {
            self.loginView.transform = CGAffineTransformIdentity
        })
    }

    @IBAction func onCancelTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
