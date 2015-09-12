//
//  SignUpController.swift
//  See You Then
//
//  Created by Anna Jo McMahon on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//
import Parse
import UIKit




class SignUpController: UIViewController {
	@IBOutlet var password: UITextField!
	@IBOutlet var email: UITextField!
	@IBOutlet var username: UITextField!
	
	@IBAction func signupAction(sender: UIButton) {
		var user = PFUser()
  		user.username = username.text
  		user.password = password.text
  		user.email = email.text
		
  // other fields can be set just like with PFObject
  //user["phone"] = "415-392-0202"
		user.setObject("phone", forKeyedSubscript: "foo")

		
  user.signUpInBackgroundWithBlock {
	(succeeded: Bool, error: NSError?) -> Void in
	if let error = error {
		let errorString = error.userInfo?["error"] as? NSString
		self.showAlert(errorString!)
	} else {
		self.performSegueWithIdentifier("signupSegue", sender: self)
	}
  }
		
	}
	
	
	func showAlert(error: NSString){
		var createAccountErrorAlert: UIAlertView = UIAlertView()
		createAccountErrorAlert.delegate = self
		createAccountErrorAlert.title = "Oops"
		createAccountErrorAlert.message = error as String
		createAccountErrorAlert.addButtonWithTitle("OK")
		createAccountErrorAlert.show()
	}
	
	func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
		switch buttonIndex{
		case 0:
			NSLog("Retry");
			break;
		default:
			NSLog("Default");
			break;
			//Some code here..
			
		}
	}
	

}
