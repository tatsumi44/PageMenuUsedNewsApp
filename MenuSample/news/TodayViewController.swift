//
//  TodayViewController.swift
//  MenuSample
//
//  Created by tatsumi kentaro on 2018/08/05.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var contentsArraies = [String:[Contents]]()
    var contentsArray = [Contents]()
    var num:Int!
    @IBOutlet weak var mainTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTable.dataSource = self
        mainTable.delegate = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        contentsArraies = appDelegate.contentsArraies
        contentsArray = contentsArraies["0"]!
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = contentsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        num = indexPath.row
        performSegue(withIdentifier: "Go", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newsviewcontroller = segue.destination as! NewsViewController
        newsviewcontroller.contents = self.contentsArray[num]
    }
    

}
