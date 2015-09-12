//
//  loginViewController.swift
//  wellness
//
//  Created by Anna Jo McMahon on 3/2/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//
import Parse
import UIKit

class loginViewController: UIViewController {
	
	@IBOutlet var usernametext: UITextField!
	@IBOutlet var passwordtext: UITextField!
	@IBOutlet var loginButton: UIButton!
	@IBOutlet var createAccount: UIButton!
	@IBOutlet var backView: UIView!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		//Looks for single or multiple taps.
		var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
		//backView.addGestureRecognizer(tap)
		
	}
	@IBAction func createAccount(sender: AnyObject) {
		//performSegueWithIdentifier("createAccountSegue", sender: self)
		self.dismissViewControllerAnimated(true, completion: {});

	}
	

	//Calls this function when the tap is recognized.
	func DismissKeyboard(){
		//Causes the view (or one of its embedded text fields) to resign the first responder status.
	//	backView.endEditing(true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func loginButtonAction(sender: UIButton) {
		PFUser.logInWithUsernameInBackground(usernametext.text, password:passwordtext.text) {
			(user: PFUser?, error: NSError?) -> Void in
			if user != nil {
				self.performSegueWithIdentifier("completedLoginSegue", sender: self)
			} else {
    				self.showAlert()
			}
		}
	
	}
	
	
	func showAlert(){
		var createAccountErrorAlert: UIAlertView = UIAlertView()
		createAccountErrorAlert.delegate = self
		createAccountErrorAlert.title = "Oops"
		createAccountErrorAlert.message = "That is not an account"
		createAccountErrorAlert.addButtonWithTitle("Create Account")
		createAccountErrorAlert.addButtonWithTitle("Dismiss")
		createAccountErrorAlert.show()
	}
	
	
	
	func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
		
		switch buttonIndex{
		case 1:
			NSLog("Retry");
			break;
		case 0:
			self.performSegueWithIdentifier("createAccountSegue", sender: self)
			break;
		default:
			NSLog("Default");
			break;
			//Some code here..
			
		}
	}
	
	
}

