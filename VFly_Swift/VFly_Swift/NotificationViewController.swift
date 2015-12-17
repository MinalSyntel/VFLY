//
//  NotificationViewController.swift
//  VFly_Swift
//
//  Created by Digital One on 12/13/15.
//  Copyright © 2015 Syntel. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCutomButtonsToNavigationController(self.navigationController!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.numberOfLines = 3;
        cell.textLabel!.textColor = UIColor(red: 107.0/255.0, green:150.0/255.0, blue:200.0/255.0, alpha: 1.0)
        // Configure the cell...
        switch (indexPath.row) {
        case 0:
            cell.textLabel!.text = "Today's Flight Reminder: Scheduled ON TIME";
            break;
        case 1:
            cell.textLabel!.text = "Flight No. A737";
            break;
        case 2:
            cell.textLabel!.text = "Cab Info: Avis - A1315 @ 14:15";
            break;
        case 3:
            cell.textLabel!.text = "Your tommorrow's flight is delayed by more than 20 minutes ";
            break;
        case 4:
            cell.textLabel!.text = "*Updates will promptly notify you if there is another change in the status of your flight";
           
            
            cell.textLabel!.textColor = UIColor(red:255.0/255.0, green: 0, blue: 0, alpha: 1.0)

            
            cell.textLabel!.font.fontWithSize(10)
            break;
            
        default:
            break;
        }

      
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.userInteractionEnabled = false

    }
    @IBAction func backButton(sender: AnyObject) {
//        var homePageViewController: HomePageViewController = self.storyboard.instantiateViewControllerWithIdentifier("home")
//        self.navigationController.pushViewController(homePageViewController, animated: false)
        
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.navigationController!.pushViewController(mainStoryboard.instantiateViewControllerWithIdentifier("home"), animated: true)
    }
    
    func addCutomButtonsToNavigationController(navigationController: UINavigationController) {
        let customNavigationTitleView: UIView = UIView(frame: CGRectMake(36, 30, 325, 44))
        let alertButton: UIButton = UIButton(type:UIButtonType.System) as UIButton
        
        
//        alertButton.addTarget(self, action: "onAlertClick" , forControlEvents: .TouchUpInside)
//        alertButton.backgroundColor = UIColor.clearColor()
//
//        let alertCountLabel: UILabel = UILabel(frame: CGRectMake(246, 14, 15, 10))
//        alertCountLabel.textColor = UIColor.whiteColor()
//        alertCountLabel.font = UIFont.systemFontOfSize(11)
//        alertCountLabel.textAlignment = .Center
//        alertCountLabel.text = "4"
        let welLabel: UILabel = UILabel(frame: CGRectMake(158, 9, 80, 20))
        welLabel.backgroundColor = UIColor.clearColor()
        welLabel.text = "WELCOME"
        welLabel.textColor = UIColor.whiteColor()
        welLabel.font = UIFont.systemFontOfSize(10.0)
        welLabel.textAlignment = .Center
        let nameLabel: UILabel = UILabel(frame: CGRectMake(158, 21, 85, 20))
        nameLabel.backgroundColor = UIColor.clearColor()
        nameLabel.text = "SJ A101"
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont.systemFontOfSize(10.0)
        nameLabel.textAlignment = .Center
        let image: UIImage = UIImage(named: "00_sep@2x.png")!
        let imageview: UIImageView = UIImageView(image: image)
        imageview.frame = CGRectMake(230, 9, 2, 32)
        let navimage: UIImage = UIImage(named: "Small_Logo.png")!
        let navimageview: UIImageView = UIImageView(image: navimage)
        navimageview.frame = CGRectMake(0, 8, 80, 30)
        alertButton.setImage(UIImage(named: "ico-bell_red@2x.png"), forState: .Normal)
        alertButton.frame = CGRectMake(219, 0, 60, 48)
       // customNavigationTitleView.addSubview(alertButton)
      //  customNavigationTitleView.addSubview(alertCountLabel)
        customNavigationTitleView.addSubview(welLabel)
        customNavigationTitleView.addSubview(nameLabel)
        customNavigationTitleView.addSubview(imageview)
        customNavigationTitleView.addSubview(navimageview)
        
        self.navigationItem.titleView = customNavigationTitleView
        
    }
}
