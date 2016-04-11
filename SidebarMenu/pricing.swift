//
//  pricing.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 07/04/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import Foundation
import UIKit

class pricing:UITableViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var doneButton: UIButton!
    var boardWeight:Double=0
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBAction func chooseButton(sender: AnyObject) {
        myPicker.hidden=false
        doneButton.hidden=false
    }
    var gradeWeight:Double=0
    var durationWeight:Double = 0
    @IBAction func pickerDone(sender: AnyObject) {
        
        let boardRow:String=myPicker.selectedRowInComponent(0).description
        let boardChosen = Board[Int(boardRow)!]
        let gradeRow:String=myPicker.selectedRowInComponent(1).description
        let gradeChosen = Grade[Int(gradeRow)!]
        let durationRow:String=myPicker.selectedRowInComponent(2).description
        let durationChosen = Duration[Int(durationRow)!]
        
        let bWeightResult = db.query("select Weight from BoardFactor where Board='\(boardChosen)'", parameters: nil)
        for row in bWeightResult{
            boardWeight = row["Weight"] as! Double
        }
        let gWeightResult = db.query("select Weight from StandardFactor where Grade='\(gradeChosen)'", parameters: nil)
        for row in gWeightResult{
            gradeWeight = row["Weight"] as! Double
        }
        let dWeightResult = db.query("select Weight from DurationFactor where Duration='\(durationChosen)'", parameters: nil)
        for row in dWeightResult{
            durationWeight = row["Weight"] as! Double
        }
        myPicker.hidden=true
        doneButton.hidden=true
        boardLabel.text=boardChosen
        gradeLabel.text=gradeChosen
        durationLabel.text=durationChosen
        
    }
   let db = SQLiteDB.sharedInstance()
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var filterView: UIView!
    var Board:[String] = []
    var Grade:[String] = []
    var Duration:[String] = []
    var pickerData:[[String]]=[]
 //   var boardChosen:String=[]
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
       
        
        let resultBoard = db.query("select Board from BoardFactor", parameters: nil)
        for row in resultBoard
        {
            Board.append(row["Board"] as! String)
        }
       let resultGrade = db.query("select Grade from StandardFactor", parameters: nil)
        
        for row in resultGrade
        {
            let chara:String = "\(row["Grade"])"
            var chara1:[String] = chara.componentsSeparatedByString("(")
            var gradeString:[String]=chara1[1].componentsSeparatedByString(")")
            Grade.append(gradeString[0])
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