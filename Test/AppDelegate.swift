//
//  AppDelegate.swift
//  Test
//
//  Created by User on 25.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    enum StorageKey: String {
        case startDate
        case profile
        case existProfile
        case firstLaunch
        case lastLaunch
    }
    
    private let assembly = Assembly()
    
    lazy var formatter = assembly.dateFormatter(format: .HHmmss)
    lazy var dataStorage = assembly.dataStorage
    
    var dateLaunch: Date!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        
        let userDefaults = UserDefaults.standard
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
    
  
        let userDefaultsStorage = UserDefaultsStorage(encoder: encoder, decoder: decoder, userDefaults: userDefaults)
        
        //UserDefaults.standard.set(nil, forKey: StorageKey.profile.rawValue)
        
        if(userDefaultsStorage.userExist(key: StorageKey.profile.rawValue)){

            if let user: Profile = userDefaultsStorage.value(key: StorageKey.profile.rawValue) {
                print("\n\(user)\n")
            }

        }
        else{
            let user = Profile(id: "1",name: "Alex")
            userDefaultsStorage.save(value: user, key: StorageKey.profile.rawValue)
        }
        
        /*
        guard let data = try? encoder.encode(Profile(id: "121", name: "text"))
        else{
            return true
        }

        let profile = try? decoder.decode(Profile.self, from: data)
         */

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

