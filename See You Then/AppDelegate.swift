//
//  AppDelegate.swift
//  See You Then
//
//  Created by Anna Jo McMahon on 9/12/15.
//  Copyright (c) 2015 anna. All rights reserved.
//

import UIKit
import CoreData
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


 func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
	// [Optional] Power your app with Local Datastore. For more info, go to
	// https://parse.com/docs/ios_guide#localdatastore/iOS
	Parse.enableLocalDatastore()
 
	// Initialize Parse.
	Parse.setApplicationId("OqTo7E8jlAb9PvdjSpT92n1ryuH3MTAbtGb9lMTi",
		clientKey: "lo0XFiOFOHlncTzB1NhF9kHQeNPSycr2A2kuYVBN")
 
	// [Optional] Track statistics around application opens.
	PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
 
	// push notifications
	let userNotificationTypes = (UIUserNotificationType.Alert |  UIUserNotificationType.Badge |  UIUserNotificationType.Sound);
	
	let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
	application.registerUserNotificationSettings(settings)
	application.registerForRemoteNotifications()
	
	
	return true;
	}

	
}

