//
//  TabBarViewController.swift
//  CodePathWeek5HW
//
//  Created by Yi on 9/7/14.
//  Copyright (c) 2014 Dropbox. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    var currentButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var exploreImageView: UIImageView!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as ComposeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as TrendingViewController
        
        homeViewController.view.frame = contentView.frame
        contentView.addSubview(homeViewController.view)
        
        currentButton = homeButton
        homeButton.selected = true
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
            self.exploreImageView.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTabBarTap(sender: AnyObject) {
        var button = sender as UIButton

        switch button.tag {
        case 0:
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)
        case 1:
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
        case 3:
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
        default:
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
        }
        
        currentButton.selected = false
        button.selected = true
        currentButton = button
        
        if button.tag == 1 {
            exploreImageView.hidden = true
        } else {
            exploreImageView.hidden = false
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        // TODO: animate the transition
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        if isPresenting {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                }) { (finished: Bool) -> Void in
                    fromViewController.view.alpha = 0
                    transitionContext.completeTransition(true)
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as ComposeViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }

}
