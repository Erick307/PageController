//
//  ChildController.swift
//  PageController
//
//  Created by Erick Silva on 16/09/14.
//  Copyright (c) 2014 fluxoft. All rights reserved.
//

import UIKit

class ChildController: UIViewController {

    var index: Int?
    
    class func getViewController(index i:Int) ->UIViewController{
        
        var childController = ChildController()
        childController.index = i
        return childController
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        
        var color : UIColor
        switch index!{
        case 0:
            color = UIColor.magentaColor()
        case 1:
            color = UIColor.blueColor()
        case 2:
            color = UIColor.orangeColor()
        case 3:
            color = UIColor.greenColor()
        case 4:
            color = UIColor.brownColor()
        default:
            color = UIColor.whiteColor()
        }
        self.view.backgroundColor = color
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
