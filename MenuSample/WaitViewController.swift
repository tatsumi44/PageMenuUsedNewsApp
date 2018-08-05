
//
//  WaitViewController.swift
//  MenuSample
//
//  Created by tatsumi kentaro on 2018/08/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftDate
class WaitViewController: UIViewController {
    
    var json:JSON!
    var flag = false
    var apple = "apple"
    var contentsArray = [Contents]()
    var contentsArraies = [String:[Contents]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<7{
            getAPI(days: i)
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GO"{
            let viewContraller = segue.destination as! ViewController
            viewContraller.contentsArraies = self.contentsArraies
        }
    }
    func getAPI(days:Int) {
        var date = Date()
        date = date - days.day
        print(date.string(custom: "yyyyMMdd"))
        Alamofire.request("https://intense-wave-30042.herokuapp.com/news", method: .get, parameters: ["date":date.string(custom: "yyyyMMdd")], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            guard let objectStr = response.result.value else { return }
            let object = (objectStr as AnyObject).data(using: String.Encoding.utf8.rawValue)
            self.json = JSON(object as Any)
            print(self.json)
            self.contentsArray = [Contents]()
            for i in 0..<self.json.count{
                self.contentsArray.append(Contents(url: self.json[i]["url"].url!, name: self.json[i]["name"].string!, date: self.json[i]["date"].string!))
            }
            self.contentsArraies["\(days)"] = self.contentsArray
            print(self.contentsArraies)
            if self.contentsArraies.count == 7{
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.contentsArraies = self.contentsArraies
                self.performSegue(withIdentifier: "GO", sender: nil)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
