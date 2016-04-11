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
    @IBOutlet weak var hindiImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var vocabImage: UIImageView!
    @IBOutlet weak var mathImage: UIImageView!
    @IBOutlet weak var scienceImage: UIImageView!
    @IBOutlet weak var sstImage: UIImageView!
    @IBOutlet weak var engImage: UIImageView!
    @IBOutlet weak var olympiadImage: UIImageView!
    var boardWeight:Double=0
    @IBOutlet weak var boardLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    var type1:Double=0
    var type2:Double=0
    var type3:Double=0
    var type1Weight:Double=0
    var type2Weight:Double=0
    var type3Weight:Double=0
    var type1Price:Double=0
    var type2Price:Double=0
    var type3Price:Double=0
    @IBAction func chooseButton(sender: AnyObject) {
        myPicker.hidden=false
        doneButton.hidden=false
    }
    @IBAction func updateButton(sender: AnyObject) {
        let type1Result = db.query("select Weight from SubType where Type='1'", parameters: nil)
        for row in type1Result{
           type1Weight = row["Weight"] as! Double
        }
        
        let type2Result = db.query("select Weight from SubType where Type='2'", parameters: nil)
        for row in type2Result{
            type2Weight = row["Weight"] as! Double
        }
        
        let type3Result = db.query("select Weight from SubType where Type='3'", parameters: nil)
        for row in type3Result{
            type3Weight = row["Weight"] as! Double
        }
        
        let type1priceResult = db.query("select Price from SubType where Type='1'", parameters: nil)
        for row in type1priceResult{
            type1Price = row["Price"] as! Double
        }
        let type2priceResult = db.query("select Price from SubType where Type='2'", parameters: nil)
        for row in type2priceResult{
            type2Price = row["Price"] as! Double
        }
        let type3priceResult = db.query("select Price from SubType where Type='3'", parameters: nil)
        for row in type3priceResult{
            type3Price = row["Price"] as! Double
        }
        self.pickerDone(self)
        let effectiveSubjects = type1*type1Weight+type2*type2Weight+type3*type3Weight
        let subjectPrice = type1*type1Price+type2*type2Price+type3*type3Price
        let subjectFactor = (1-0.01*(effectiveSubjects-1))*pow(0.96, (effectiveSubjects-1))
        let FinalPrice = 100*(ceil(subjectPrice*subjectFactor*boardWeight*gradeWeight*durationWeight/100))
        let RawPrice = 100*(round(subjectPrice*boardWeight*gradeWeight/100))
        let Discount = ceil(((RawPrice-FinalPrice)/RawPrice)*100)
        print(subjectPrice*subjectFactor*boardWeight*gradeWeight*durationWeight)
        updateDiscount.text = "DISCOUNT: \(Discount)%"
        updateRawPrice.text = "RAW PRICE: Rs.\(RawPrice)"
        updateFinalPrice.text = "FINAL PRICE: Rs.\(FinalPrice)"
        

    }
    @IBOutlet weak var updateRawPrice: UILabel!
    @IBOutlet weak var updateFinalPrice: UILabel!
    @IBOutlet weak var updateDiscount: UILabel!
    @IBAction func vocabCheck(sender: AnyObject) {
        if(vocabImage.image==UIImage(named: "vocab")){
            vocabImage.image=UIImage(named:"vocab_c")
            type3+=1
        }else{
            vocabImage.image=UIImage(named:"vocab")
            type3-=1
        }
        
    }
    @IBAction func sstCheck(sender: AnyObject) {
        if(sstImage.image==UIImage(named: "sst")){
            sstImage.image=UIImage(named:"sst_c")
            type1+=1
        }else{
            sstImage.image=UIImage(named:"sst")
            type1-=1
        }
    }
    @IBAction func scienceCheck(sender: AnyObject) {
        if(scienceImage.image==UIImage(named: "science")){
            scienceImage.image=UIImage(named:"science_c")
            type1+=1
        }else{
            scienceImage.image=UIImage(named:"science")
            type1-=1
        }

    }
    @IBAction func olypiadCheck(sender: AnyObject) {
        if(olympiadImage.image==UIImage(named: "olympiad")){
            olympiadImage.image=UIImage(named:"olympiad_c")
            type2+=1
        }else{
            olympiadImage.image=UIImage(named:"olympiad")
            type2-=1
        }

    }
    @IBAction func mathCheck(sender: AnyObject) {
        if(mathImage.image==UIImage(named: "math")){
            mathImage.image=UIImage(named:"math_c")
            type1+=1
        }else{
            mathImage.image=UIImage(named:"math")
            type1-=1
        }
   
    }
    @IBAction func engCheck(sender: AnyObject) {
        if(engImage.image==UIImage(named: "eng")){
            engImage.image=UIImage(named:"eng_c")
            type1+=1
        }else{
            engImage.image=UIImage(named:"eng")
            type1-=1
        }
   
    }
    @IBAction func hindiCheck(sender: AnyObject) {
        if(hindiImage.image==UIImage(named: "hindi")){
            hindiImage.image=UIImage(named:"hindi_c")
            type2+=1
        }else{
            hindiImage.image=UIImage(named:"hindi")
            type2-=1
        }
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
        print(durationWeight)
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
        type1=0
        type2=0
        type3=0
        
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