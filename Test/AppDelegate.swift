//
//  AppDelegate.swift
//  Test
//
//  Created by User on 25.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var dateLaunch: Date!
    var firstTimeLaunch: Bool!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        
        //UserDefaults.standard.set(false, forKey: "firstTimeLaunch")
        firstTimeLaunch = UserDefaults.standard.bool(forKey: "firstTimeLaunch")
        
        if (firstTimeLaunch){
            firstTimeLaunch = true
            dateLaunch = Date()
            UserDefaults.standard.set(dateLaunch.timeIntervalSince1970,forKey: "lastLaunchDate")
            let first = Date(timeIntervalSince1970: UserDefaults.standard.double(forKey: "firstLaunchDate"))
            let last = Date(timeIntervalSince1970: UserDefaults.standard.double(forKey: "lastLaunchDate"))
            let timeInterval = last.timeIntervalSince(first)
            let formater = String(format: "%.3f", timeInterval)
            print("Время, прошедшее между первым и последним запусками приложения - \(formater) сек.")
        }
        else {
            UserDefaults.standard.set(true, forKey: "firstTimeLaunch")
            dateLaunch = Date()
            UserDefaults.standard.set(dateLaunch.timeIntervalSince1970,forKey: "firstLaunchDate")
        }
        
        //let string = MagicFormatter(format: "HH:mm:ss").format(date: Date())
        //print(string)
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication){
        print(#function)
    }

    // MARK: UISceneSession Lifecycle
    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
     */

}

