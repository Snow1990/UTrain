//
//  SideMenuTableViewController.swift
//  UTrain
//
//  Created by SN on 15/6/23.
//  Copyright (c) 2015年 Snow. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 7
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SideMenuReusableCellID, forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.backgroundColor = UIColor.clearColor()
        var cellText: String?
        switch indexPath.row {
        case 0: cellText = Constants.CourseType.TDW.rawValue
        case 1: cellText = Constants.CourseType.GYFZ.rawValue
        case 2: cellText = Constants.CourseType.JYCY.rawValue
        case 3: cellText = Constants.CourseType.XQAH.rawValue
        case 4: cellText = Constants.CourseType.KWHD.rawValue
        case 5: cellText = Constants.CourseType.QGCSJPK.rawValue
        case 6: cellText = Constants.CourseType.WYGKK.rawValue
        default: cellText = nil
        }
        cell.textLabel?.text = cellText
        cell.textLabel?.textColor = UIColor.whiteColor()
//        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
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
