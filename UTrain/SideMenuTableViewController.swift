//
//  SideMenuTableViewController.swift
//  UTrain
//
//  Created by SN on 15/6/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit
import Alamofire

protocol SideMenuTableViewDelegate {
    func sideMenu(didSelectMaxType maxType: MaxType)
}

class SideMenuTableViewController: UITableViewController {

    // 当前大类
    var currentMaxType: MaxType?
    var delegate: SideMenuTableViewDelegate?
    
    // 大类
    var maxTypeArr = [MaxType](){
        didSet {
            self.tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()

        initTableView()
        

        
        
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 数据初始化
    func initData() {
        
        Alamofire.request(.GET, Network.GetPublicMaxType).responseJSON { (_, _, data, error) -> Void in
            if let json = data as? [NSDictionary] {
                for type in json {
                    let maxType = MaxType(maxType: type)
                    self.maxTypeArr.append(maxType)
                    
                }
                if !self.maxTypeArr.isEmpty {
                    self.delegate?.sideMenu(didSelectMaxType: self.maxTypeArr[0])
                }
            }
        }
        
    }
    
    // tableView初始化
    func initTableView() {
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        tableView.separatorStyle = .None
        tableView.backgroundColor = Constants.SideMenuBGColor
        tableView.scrollsToTop = false
        tableView.scrollEnabled = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        //注册TableViewCellID
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: Constants.SideMenuReusableCellID)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maxTypeArr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SideMenuReusableCellID, forIndexPath: indexPath) as! UITableViewCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = maxTypeArr[indexPath.row].maxTypeName
        cell.textLabel?.textColor = UIColor.whiteColor()
        //        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }

    
    
    // MARK: - table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.yellowColor()
        self.currentMaxType = maxTypeArr[indexPath.row]
        delegate?.sideMenu(didSelectMaxType: self.currentMaxType!)

//        self.currentMaxTypeId = maxTypeArr[indexPath.row].maxTypeId
//        self.currentPage = 1
//        self.coursesByPage = []
//        self.isLoaded = false
//        let leftBarButtonLabel = self.navigationItem.leftBarButtonItem?.customView?.viewWithTag(1) as? UILabel
//        leftBarButtonLabel?.text = maxTypeArr[indexPath.row].maxTypeName
//        
//        self.toggle()
//        self.loadData()
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.whiteColor()
    }

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
