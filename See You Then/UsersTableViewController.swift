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
	var profPics: [UIImage] = [
		UIImage(named: "barack.gif")!,
		UIImage(named: "AE.jpg")!,
		UIImage(named: "jkf.jpg")!,
		UIImage(named: "bc.jpg")!,
		UIImage(named: "jkf.jpg")!,
		UIImage(named: "marlyn.jpg")!,
		UIImage(named: "oprah.jpg")!,
		UIImage(named: "marlyn.jpg")!,
		UIImage(named: "jkf.jpg")!,
		UIImage(named: "jkf.jpg")!,
		UIImage(named: "marlyn.jpg")!,
		UIImage(named: "oprah.jpg")!,
		UIImage(named: "marlyn.jpg")!,
		UIImage(named: "jkf.jpg")!
	]
//	var colors: [String] = [
//		[173,255,47],  //green
//		[154,205,50],
//		[255,165,0],
//		[255,69,0],
//		[255,0,0]
//	]

    override func viewDidLoad() {
        super.viewDidLoad()
		var currentUser = PFUser.currentUser()

		if currentUser != nil {
			println("there is a  user")
		} else {
			println("no user")
			self.performSegueWithIdentifier("loginSegue", sender: self)
		}
	
        var query = PFUser.query()!
        userData = query.findObjects()!
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
		cell.profPic.image = profPics[row]
		if (cell.status.text)!.toInt() <= 3 {
			cell.backgroundColor = UIColor(red: 65/255, green: 212/255, blue: 114/255, alpha: 1.0) // green
		}
		else if (cell.status.text)!.toInt() <= 6 {
			cell.backgroundColor = UIColor(red: 154/255, green: 205/255, blue: 50/255, alpha: 1.0) // green
		}
		else if (cell.status.text)!.toInt() <= 10 {
			cell.backgroundColor = UIColor(red: 255/255, green: 165/255, blue: 0, alpha: 1.0) // green
			}
		else if (cell.status.text)!.toInt() <= 14 {
			cell.backgroundColor = UIColor(red: 255/255, green: 69/255, blue: 0, alpha: 1.0) // green
			}
		else {
			cell.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1.0) // green
			}
//		else if cell.status <= 10 {
//				cell.backgroundColor = colors[2]
//		}
//		else if cell.status <= 14 {
//				cell.backgroundColor = colors[1]
//		}
//		else{
//			cell.backgroundColor = colors[0]
//		}
        //cell.profPic = userData[row].profPic
        return cell
        }

        // Configure the cell...

        return (tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? UITableViewCell)!
    }
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "personSelected" {
			let navController = segue.destinationViewController as! UINavigationController
			let nextView = navController.topViewController as! TimerViewController
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
