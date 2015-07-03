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
        tableView.registerClass(SideMenuTableViewCell.self, forCellReuseIdentifier: Constants.SideMenuReusableCellID)
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maxTypeArr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SideMenuReusableCellID, forIndexPath: indexPath) as! SideMenuTableViewCell
        
        cell.title = maxTypeArr[indexPath.row].maxTypeName

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let title = maxTypeArr[indexPath.row].maxTypeName
        let size = UILabel.sizeOfString(title,
            font: Constants.Font3,
            maxWidth: 280 * Constants.Scale)

        let cellHeight = size.height + 58 * Constants.Scale
        
        return cellHeight
    }
    
    
    // MARK: - table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.yellowColor()
        self.currentMaxType = maxTypeArr[indexPath.row]
        delegate?.sideMenu(didSelectMaxType: self.currentMaxType!)
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.textLabel?.textColor = UIColor.whiteColor()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
