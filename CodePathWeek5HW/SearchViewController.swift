//
//  SearchViewController.swift
//  CodePathWeek5HW
//
//  Created by Yi on 9/7/14.
//  Copyright (c) 2014 Dropbox. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loading: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        searchImageView.hidden = true
        loading.hidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(0.5) {
            self.loading.image = UIImage(named: "loading-2")
        }
        delay(1) {
            self.loading.image = UIImage(named: "loading-3")
        }
        delay(1.5) {
            self.searchImageView.hidden = false
            self.loading.hidden = true
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
