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
	
    @IBOutlet weak var timePicker: UIPickerView!
	var currentPerson : PFUser = PFUser()

	@IBOutlet var personName: UILabel!
	let timePickerHoursData = [0,1, 2, 3, 4, 5]//["0", "1", "2", "3", "4", "5"]
    
    let timePickerMinutesData = [00,05,10, 15,20, 30]//["00", "05","10","15", "20", "30"]
    
    
	@IBAction func cancelTimer(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: {});
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		
        timePicker.delegate = self
		personName.text = currentPerson.username

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // components are ACROSS
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
	// Scrollable upt and down
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
			if(component == 0){
				return timePickerHoursData.count
			}
			else{
				return timePickerMinutesData.count
			}
		}
	func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		return 100
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		if(component == 0){
			
			return String(self.timePickerHoursData[row])
		}
		else{
			return String(timePickerMinutesData[row])
		}
		}
		
    @IBAction func startButtonClicked(sender: UIButton) {
		
		var hours = timePickerHoursData[timePicker.selectedRowInComponent(0)]
		var minutes = timePickerMinutesData[timePicker.selectedRowInComponent(1)]
		var timeMinutes = minutes + hours*60;
		
        self.title = "Stop";
		
		var challenge = PFObject(className:"Challenges")
		challenge.setValue("ANNA", forKey: "Challenger")
		challenge.setValue(currentPerson.username!, forKey: "Challenged")
		challenge.setValue(timeMinutes, forKey: "timeLeft")
		
		
		challenge.saveInBackgroundWithBlock {
			(success: Bool, error: NSError?) -> Void in
			if (success) {
			println("success")
			} else {
				println("not")

			}
		}
    }

}