//
//  ViewController.swift
//  PageController
//
//  Created by Erick Silva on 16/09/14.
//  Copyright (c) 2014 fluxoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var childsArray: NSArray?
    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //get PageControl
        var pageControl:UIPageControl?
        for view in pageViewController!.view.subviews{
            if view.isKindOfClass(UIPageControl){
                pageControl = view as? UIPageControl
            }
        }
        //Customize the PageControl as you want
        pageControl?.frame = CGRect(x: 0, y: pageControl!.frame.origin.y-101, width: pageControl!.frame.width, height: pageControl!.frame.height)
        pageControl?.enabled = false
        pageControl?.pageIndicatorTintColor = UIColor.blackColor()
    }
    
    override func loadView() {
        super.loadView()
        
        //Save childs into an Array
        var child0 = ChildController.getViewController(index: 0)
        var child1 = ChildController.getViewController(index: 1)
        var child2 = ChildController.getViewController(index: 2)
        var child3 = ChildController.getViewController(index: 3)
        var child4 = ChildController.getViewController(index: 4)
        childsArray = [child0,child1,child2,child3,child4]
        
        //Add PageViewController
        pageViewController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation:
            UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height+37)
        pageViewController!.setViewControllers([child0], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        pageViewController!.dataSource = self
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        
        
        //Add Buttom
        var button = UIButton(frame: CGRect(x: 0, y: pageViewController!.view.frame.size.height-101, width: self.view.frame.size.width, height: 64))
        button.setTitle("I'm a Button", forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(20)
        button.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 1, alpha: 0.6);
        self.view.addSubview(button);

    }
    
    //UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController:UIViewController) -> UIViewController?{
        var index = (viewController as ChildController).index
        if (index == 0) {
            return nil
        }
        var i = index! - 1
        return childsArray!.objectAtIndex(i) as? UIViewController;
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        var index = (viewController as ChildController).index
        if (index == 4) {
            return nil
        }
        var i = index! + 1
        return childsArray!.objectAtIndex(i) as? UIViewController;
    }

    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int{
        return 5
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int{
        return 0
    }
}
