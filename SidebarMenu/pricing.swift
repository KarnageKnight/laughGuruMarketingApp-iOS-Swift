//
//  pricing.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 07/04/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import Foundation
import UIKit

class pricing: UITableViewController{
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var filterView: UIView!
    var dropDownMenu = IGLDropDownMenu()
    var dataTitle:NSArray = ["CBSE",
        "ICSE",
        "SSC",
        "IGSCE",
        "IB"]
    @IBAction func backButton(sender: AnyObject) {
    
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        resultView.layer.cornerRadius=9
        resultView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        resultView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        resultView.layer.shadowOpacity = 0.8
        
        resultView.layer.shadowRadius = 4
        filterView.layer.cornerRadius=9
        
        filterView.layer.shadowColor = UIColor.darkGrayColor().CGColor
        filterView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        filterView.layer.shadowOpacity = 0.8
        
        filterView.layer.shadowRadius = 4
        setupInit()
    }
    
    func setupInit(){
        var dropdownItems:NSMutableArray = NSMutableArray()
        
        for i in 0...(dataTitle.count-1) {
            
            var item = IGLDropDownItem();
            item.text = "\(dataTitle[i])"
            dropdownItems.addObject(item)
        }
        dropDownMenu.menuText = ""
        dropDownMenu.dropDownItems = dropdownItems as [AnyObject]
        dropDownMenu.paddingLeft = 15
        dropDownMenu.frame = CGRectMake((self.view.frame.size.width/2) - 150, 100, 100, 20)
        //dropDownMenu.delegate = dropDownMenu()
        dropDownMenu.type = IGLDropDownMenuType.Stack
        dropDownMenu.gutterY = 5
        dropDownMenu.itemAnimationDelay = 0.1
        //dropDownMenu.rotate = IGLDropDownMenuRotate.Random //add rotate value for tilting the
        dropDownMenu.reloadView()
        
    
        self.view.addSubview(self.dropDownMenu)
    }
}