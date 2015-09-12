//
//  ViewController.swift
//  See You Then
//
//  Created by Anna Jo McMahon on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let testObject = PFObject(className: "TestObject")
		testObject.setObject("bar", forKeyedSubscript: "foo")
		testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
			println("Object has been saved.")
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func startButtonClick(sender: UIButton) {
		var phoneNumber1 = 720-440-4892
		var phoneNumber2 = 612-618-3669
		var time = 10;
		
	
		// make calls to twilio api with two numbers
        // hello anna
	}

}

