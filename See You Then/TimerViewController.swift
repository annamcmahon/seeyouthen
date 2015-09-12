//
//  TimerViewController.swift
//  See You Then
//
//  Created by Royce Branning on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit
import Parse


class TimerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var userPicker: UIPickerView!
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    let userPickerData = ["Bob","Joe","Stan"]
    let timePickerData = ["5","10","15"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPicker.
        userPicker.delegate = self
        //timePicker.source = self
        timePicker.delegate = self
        // Do any additional setup after loading the view.
		var currentUser = PFUser.currentUser()
		if currentUser != nil {
			println("there is a  user")
		} else {
			println("no user")
			self.performSegueWithIdentifier("loginSegue", sender: self)
		}
		// get user picker data
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if(pickerView == userPicker){
			return userPickerData.count
		}
		else{
			return timePickerData.count
		}
    }
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
			return userPickerData[row]
		}
		else{
			return self.timePickerData[row]
		}
		
	}
    @IBAction func startButtonClicked(sender: UIButton) {
        self.title = "Stop";
    }
}
