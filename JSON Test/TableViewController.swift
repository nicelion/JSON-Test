//
//  TableViewController.swift
//  JSON Test
//
//  Created by Ian Thompson on 12/20/15.
//  Copyright © 2015 Ian Thompson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var JSON_Info = [JSONInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        var jsonResults: AnyObject
        
      //  let webUrl = NSURL(string: "https://website.com/directory/json.json")
      
        let URL = NSBundle.mainBundle().URLForResource("TutorialJSON", withExtension: "json")
        
        
        if let JSONData = NSData(contentsOfURL: URL!) {
            
            do {
                
                jsonResults = try NSJSONSerialization.JSONObjectWithData(JSONData, options: [])
                
                if let infoArray = jsonResults["Posts"] as? [NSDictionary] {
                    
                    for item in infoArray {
                        
                        JSON_Info.append(JSONInfo(json: item))
                        
                    }
                    
                }
                
                
            } catch {
                
                print("Fetch Failed: \((error as NSError).localizedDescription)")
                
            }
            
            
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        
        return JSON_Info.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        
        if JSON_Info[indexPath.row].isBlue == true {
            
            cell.titleLabel.textColor = UIColor.blueColor()
            
            
        } else{
            
            cell.titleLabel.textColor = UIColor.blackColor()
        }
        
        
        cell.titleLabel?.text = JSON_Info[indexPath.row].title
        cell.descriptionLabel?.text = JSON_Info[indexPath.row].description
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            let imageOfPost = self.JSON_Info[indexPath.row].image!
            
            cell.postImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: imageOfPost)!)!)
            
            
            })
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let urlOfPost = JSON_Info[indexPath.row].url
        
        let url = NSURL(string: urlOfPost!)
        
        
        UIApplication.sharedApplication().openURL(url!)
        
        tableView.reloadData()
        
    }

}






