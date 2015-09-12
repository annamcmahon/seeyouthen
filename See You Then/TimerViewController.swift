//
//  TimerViewController.swift
//  See You Then
//
//  Created by Royce Branning on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var userPicker: UIPickerView!
    
    @IBOutlet weak var timePicker: UIPickerView!
    
    let userPickerData = ["Bob","Joe","Stan"]
    let timePickerData = [5,10,15]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPicker.
        userPicker.delegate = self
        //timePicker.source = self
        timePicker.delegate = self
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
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userPickerData.count
    }

    @IBAction func startButtonClicked(sender: UIButton) {
        self.title = "Stop";
    }
}
