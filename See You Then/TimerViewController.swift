//
//  TimerViewController.swift
//  See You Then
//
//  Created by Royce Branning on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit
import Parse


class TimerViewController: UIViewController,UIPickerViewDelegate {
	var minutes = 0
	var seconds = 0
	
    @IBOutlet weak var timePicker: UIPickerView!
	var currentPerson : PFUser = PFUser()

	@IBOutlet var personName: UILabel!
	let timePickerMinutesData = [0,1, 2, 3, 4, 5]//["0", "1", "2", "3", "4", "5"]
	let units = ["min", "sec"]
    let timePickerSecondsData = [00,05,10, 15,20, 30]//["00", "05","10","15", "20", "30"]
    
    
	@IBAction func cancelTimer(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: {});
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		timePicker.showsSelectionIndicator = true
		//timePicker.selectedRowInComponent(0)

        timePicker.delegate = self
		personName.text = currentPerson.username

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // components are ACROSS
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
	// Scrollable upt and down
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
			if(component == 0){
				return timePickerMinutesData.count
			}
			else if component == 1{
				return 1
			}
			else if component == 2 {
				return timePickerSecondsData.count
			}
			else{
				return 1
			}
		}
	func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		return 100
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		if component == 0 {
			return String(self.timePickerMinutesData[row])
		}
		else if component == 1{
			return String(self.units[0])
		}
		else if component == 2 {
			return String(self.timePickerSecondsData[row])
		}
		else{
			return String(self.units[1])
		}
		}
		
    @IBAction func startButtonClicked(sender: UIButton) {
		
		minutes = timePickerMinutesData[timePicker.selectedRowInComponent(0)]
		seconds = timePickerSecondsData[timePicker.selectedRowInComponent(1)]
		
        self.title = "Stop";
		
		var challenge = PFObject(className:"Challenges")
		challenge.setValue("ANNA", forKey: "Challenger")
		challenge.setValue(currentPerson.username!, forKey: "Challenged")
		challenge.setValue(minutes, forKey: "timeMinutes")
		challenge.setValue(seconds, forKey: "seconds")

		
		challenge.saveInBackgroundWithBlock {
			(success: Bool, error: NSError?) -> Void in
			if (success) {
				println("success")
			} else {
				println("not")

			}
		}
		self.performSegueWithIdentifier("startTime", sender: self)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "startTime" {
			let navController = segue.destinationViewController as! UINavigationController
			let nextView = navController.topViewController as! DDHDemoViewController
			nextView.minutes = self.minutes
			nextView.seconds = self.seconds
		}
	}
	
}