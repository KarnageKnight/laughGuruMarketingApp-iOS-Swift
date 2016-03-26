//
//  NewsTableViewController.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 11/03/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    @IBOutlet weak var backgroundUI: UIView!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var laughGuruLabel: UILabel!
    @IBOutlet weak var WhatUI: UIView!
    @IBOutlet weak var teamUI: UIView!
    @IBOutlet weak var contentDemoLabel: UILabel!
    @IBOutlet weak var ReasearchUI: UIView!
    @IBOutlet weak var associationsLabel: UILabel!
    @IBOutlet weak var researchLabel: UILabel!
    @IBOutlet weak var contentDetailsLabel: UILabel!
    @IBOutlet weak var associationsUI: UIView!
    @IBOutlet weak var testimonialsLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var CDemoUI: UIView!
    @IBOutlet weak var CDetailsUI: UIView!
    @IBOutlet weak var TestimonialsUI: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundUI.layer.cornerRadius=9
      //  homeUI.backgroundColor = UIColor.clearColor()
        
        backgroundUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        backgroundUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        backgroundUI.layer.shadowOpacity = 0.8
        
        backgroundUI.layer.shadowRadius = 4
        
        WhatUI.layer.cornerRadius=9
        
        WhatUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        WhatUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        WhatUI.layer.shadowOpacity = 0.8
        
        WhatUI.layer.shadowRadius = 4
        
        ReasearchUI.layer.cornerRadius=9

        ReasearchUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        ReasearchUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        ReasearchUI.layer.shadowOpacity = 0.8
        
        ReasearchUI.layer.shadowRadius = 4
        
        associationsUI.layer.cornerRadius=9
        
        associationsUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        associationsUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        associationsUI.layer.shadowOpacity = 0.8
        
        associationsUI.layer.shadowRadius = 4
        CDemoUI.layer.cornerRadius=9
        
        CDemoUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        CDemoUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        CDemoUI.layer.shadowOpacity = 0.8
        
        CDemoUI.layer.shadowRadius = 4
        
        CDetailsUI.layer.cornerRadius=9
        
        CDetailsUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        CDetailsUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        CDetailsUI.layer.shadowOpacity = 0.8
        
        CDetailsUI.layer.shadowRadius = 4
        
        TestimonialsUI.layer.cornerRadius=9
        
        TestimonialsUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        TestimonialsUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        TestimonialsUI.layer.shadowOpacity = 0.8
        
        TestimonialsUI.layer.shadowRadius = 4
        
        teamUI.layer.cornerRadius=9
        
        teamUI.layer.shadowColor = UIColor.darkGrayColor().CGColor
        teamUI.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        teamUI.layer.shadowOpacity = 0.8
        
        teamUI.layer.shadowRadius = 4
        
        researchLabel.numberOfLines = 0;
        researchLabel.sizeToFit()
        
      //  cell.contentView.layer.cornerRadius = 20
        //hamburger menu reveal/hide
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            let db = SQLiteDB.sharedInstance()
            var result = db.query("select * from Main WHERE ID='1'", parameters: nil)
            for row in result
            {
                
                backgroundLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='2'", parameters: nil)
            for row in result
            {
                
                laughGuruLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='3'", parameters: nil)
            for row in result
            {
                
                teamLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='4'", parameters: nil)
            for row in result
            {
                
                researchLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='5'", parameters: nil)
            for row in result
            {
                
                associationsLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='6'", parameters: nil)
            for row in result
            {
                
                contentDemoLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='7'", parameters: nil)
            for row in result
            {
                
                contentDetailsLabel.text=(row["Text"] as! String)
            }
            result = db.query("select * from Main WHERE ID='8'", parameters: nil)
            for row in result
            {
                
                testimonialsLabel.text=(row["Text"] as! String)
            }
        }
        
        //let nav = self.navigationController?.navigationBar
        // 2
        //nav?.barStyle = UIBarStyle.Black
        //nav?.tintColor = UIColor.yellowColor()
        // 3
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
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
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 8    }
/*
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        cell.contentView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        
        cell.contentView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        cell.contentView.layer.shadowOpacity = 0.8
        
        cell.contentView.layer.shadowRadius = 2
        
        cell.contentView.layer.cornerRadius = 20
        
        cell.contentView.layer.masksToBounds = true
        let headingLabel = (cell.contentView.viewWithTag(101)) as! UILabel
        let detailLabel = (cell.contentView.viewWithTag(102)) as! UILabel
        
        if indexPath.row==0{
            headingLabel.text="Background"
            detailLabel.text="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa."
            
        }else if indexPath.row==1{

            headingLabel.text="What is LaughGuru?"
            detailLabel.text="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa."
        }else if indexPath.row==2{

            headingLabel.text="Research"
            detailLabel.text="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa."
        }else if indexPath.row==3{

            headingLabel.text="Associations"
            detailLabel.text="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa."
        }else if indexPath.row==4{

            headingLabel.text="Content Demo"
            detailLabel.text=""
        }else if indexPath.row==5{

            headingLabel.text="Content Details"
            detailLabel.text="Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa."
        }else if indexPath.row==6{

            headingLabel.text="Testimonials"
            detailLabel.text=""
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row==3{
            self.performSegueWithIdentifier("toAssociations", sender: self)
        }else if indexPath.row==4{
            self.performSegueWithIdentifier("toContentDemo", sender: self)
        }else if indexPath.row==5{
            self.performSegueWithIdentifier("toContentDetails", sender: self)
        }else if indexPath.row==6{
            self.performSegueWithIdentifier("toTestimonials", sender: self)
        }
    }
*/
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

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
