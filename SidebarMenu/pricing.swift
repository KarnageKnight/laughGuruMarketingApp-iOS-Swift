//
//  pricing.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 07/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class pricing:UITableViewController{
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var filterView: UIView!
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
    }
}