//
//  NewsViewController.swift
//  MenuSample
//
//  Created by tatsumi kentaro on 2018/08/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import WebKit
import PKHUD
class NewsViewController: UIViewController, WKUIDelegate, WKNavigationDelegate  {

    @IBOutlet weak var webView: WKWebView!
    var contents: Contents!
    var num: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        num = 0
        webView.uiDelegate = self
        webView.navigationDelegate = self
        let request = NSURLRequest(url: contents.url)
//        HUD.show(.progress)
        webView.load(request as URLRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        if num == 0{
//            print("読み込み完了")
//            HUD.flash(.success, delay: 0)
//            num = num + 1
//        }
//    }
//    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
