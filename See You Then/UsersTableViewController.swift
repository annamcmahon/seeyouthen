//
//  UsersTableViewController.swift
//  See You Then
//
//  Created by Royce Branning on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit
import Parse

class UsersTableViewController: UITableViewController {
    
    var userData = Array<AnyObject>()
	var thePersonSelected = 0;

    
    func getParseData() -> Array<AnyObject>{
        var query = PFUser.query()!
        var users = query.findObjects()
        return users!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var query = PFUser.query()!
        //query.whereKey("username", equalTo: "AnnaM")
        userData = query.findObjects()!

//		query = PFQuery(className:"Challenges")
//        query.getObjectInBackgroundWithId("Fu2NG2AO7a") {
//		 (gameScore: PFObject?, error: NSError?) -> Void in
//             if error == nil && gameScore != nil {
//               //println(gameScore)
//             } else {
//             //  println(error)
//             }
		
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath)
		
		if cell != nil {
			thePersonSelected = indexPath.row
			self.performSegueWithIdentifier("personSelected", sender: self)
		}
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
        
        //get number of users from Parse
        return userData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
        if let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UserTableViewCell {
            var row = indexPath.row
			
        
        cell.userName.text = userData[row].username
		cell.status.text =  "1"//userData[row].attribute("status", atIndex: row, effectiveRange: 1,10)

        //cell.profPic = userData[row].profPic
        return cell
        }

        // Configure the cell...

        return (tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UITableViewCell)!
    }
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "personSelected" {
			let nextView = segue.destinationViewController as! TimerViewController
			nextView.currentPerson = userData[thePersonSelected] as! PFUser
		}
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
