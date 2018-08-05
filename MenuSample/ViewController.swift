//
//  ViewController.swift
//  MenuSample
//
//  Created by tatsumi kentaro on 2018/08/04.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import PageMenu
import SwiftDate
class ViewController: UIViewController {
    var pageMenu : CAPSPageMenu?
    var contentsArraies = [String:[Contents]]()
    var dateArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<7{
            var date = Date()
            date = date - i.days
            dateArray.append("\(date.string(custom: "MM/dd"))")
        }
        var controllers : [UIViewController] = []
        print(contentsArraies)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodayViewController")
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OneDays_agoViewController")
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Twodays_agoViewController")
        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Threedays_agoViewController")
        let vc4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fourdays_agoViewController")
        let vc5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Fivedays_agoViewController")
        let vc6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Sixdays_agoViewController")
        vc.title = dateArray[0]
        vc1.title = dateArray[1]
        vc2.title = dateArray[2]
        vc3.title = dateArray[3]
        vc4.title = dateArray[4]
        vc5.title = dateArray[5]
        vc6.title = dateArray[6]
        controllers.append(vc)
        controllers.append(vc1)
        controllers.append(vc2)
        controllers.append(vc3)
        controllers.append(vc4)
        controllers.append(vc5)
        controllers.append(vc6)
        
        let params: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
            .viewBackgroundColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
            .menuHeight(40.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true),
            .addBottomMenuHairline(true),
            
            ]
        
        pageMenu = CAPSPageMenu(
            viewControllers: controllers,
            frame:           CGRect(x: 0.0, y: 25.0, width:  self.view.frame.width, height:  self.view.frame.height),
            pageMenuOptions: params
        )
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        pageMenu!.didMove(toParentViewController: self)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

