//
//  pricing.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 07/04/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import Foundation
import UIKit

class pricing:UITableViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var doneButton: UIButton!
 
    @IBAction func pickerDone(sender: AnyObject) {
        myPicker.hidden=true
        doneButton.hidden=true
        
    }
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var filterView: UIView!
    var Board:[String] = []
    var Grade:[String] = []
    var Duration:[String] = []
    var pickerData:[[String]]=[]
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
        myPicker.dataSource = self
        myPicker.delegate = self
       
        let db = SQLiteDB.sharedInstance()
        let resultBoard = db.query("select Board from BoardFactor", parameters: nil)
        for row in resultBoard
        {
            Board.append(row["Board"] as! String)
        }
       let resultGrade = db.query("select Grade from StandardFactor", parameters: nil)
        
        for row in resultGrade
        {
            print(row["Grade"])
            Grade.append("\(row["Grade"])")
        }

        let resultDuration = db.query("select Duration from DurationFactor", parameters: nil)
        for row in resultDuration
        {
            Duration.append(row["Duration"] as! String)
        }
        pickerData = [Board,Grade,Duration]
    }
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch(component){
            case 0:
            return pickerData[0].count
        case 1:
            return pickerData[1].count
        case 2:
            return pickerData[2].count
        default:
            return 1
        }
    }
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    
}