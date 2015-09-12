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
    
    let timePickerData = ["5","10","15"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timePicker.source = self
        timePicker.delegate = self
        // Do any additional setup after loading the view.
        // get user picker data
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    
    //func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
       // return 1
    //}
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
			return timePickerData.count
		}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
			return self.timePickerData[row]
		}
		
    @IBAction func startButtonClicked(sender: UIButton) {
        
        self.title = "Stop";
    }

}