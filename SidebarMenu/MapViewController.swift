//
//  MapViewController.swift
//  SidebarMenu
//
//  Created by KarnageKnight on 11/03/16.
//  Copyright © 2016 KarnageKnight. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    @IBAction func backButon(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
           //hamburger menu reveal/hide
       // if self.revealViewController() != nil {
         //   menuButton.target = self.revealViewController()
           // menuButton.action = "revealToggle:"
           // self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        //}
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "logo")
        imageView.image = image
        // 5
        navigationItem.titleView = imageView
        
       /* if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
