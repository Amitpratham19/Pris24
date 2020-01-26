//
//  LoggedInUser.swift
//  Moodery
//
//  Created by Ravi Sendhav on 1/1/20.
//  Copyright © 2020 Ravi Sendhav. All rights reserved.
//

import Foundation

class LoggedInUser {
    
    // MARK: - Property
    var id          : String?
    var firstName   : String?
    var lastName    : String?
    var email       : String?
    var dob         : String?
    var gender      : String?
    var userImage   : String?

    var isUserLoggedIn  :Bool = false
    
    // MARK: Shared Instance
    static let shared: LoggedInUser = LoggedInUser()
    
    fileprivate init() {
        print("Logged sharedUser initialized")
    }
    
    // MARK: - Public Methods
    public func initLoggedInUserFromResponse(_ response: AnyObject) {
        
        //** Json Parsing using SwiftyJSON library
        let json = JSON(response)
        
        LoggedInUser.shared.id              = json[kAPI_Id].string ?? ""
        LoggedInUser.shared.firstName       = json[kAPI_FirstName].string ?? ""
        LoggedInUser.shared.lastName        = json[kAPI_LastName].string ?? ""
        LoggedInUser.shared.email           = json[kAPI_Email].string ?? ""
        LoggedInUser.shared.dob             = json[kAPI_Dob].string ?? ""
        LoggedInUser.shared.gender          = json[kAPI_Gender].string ?? ""
        LoggedInUser.shared.userImage       = json[kAPI_UserImage].string ?? ""

        LoggedInUser.shared.isUserLoggedIn  = true
        UserDefaults.standard.set(true, forKey: Key_UD_IsUserLoggedIn)
        
        saveValuesInUserDefaultFromSharedInstance()
    }
    
    func initializeFromUserDefault() {
        LoggedInUser.shared.isUserLoggedIn  = true
        
        LoggedInUser.shared.id              = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_Id))
        LoggedInUser.shared.firstName       = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_FirstName))
        LoggedInUser.shared.lastName        = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_LastName))
        LoggedInUser.shared.email           = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_Email))
        LoggedInUser.shared.dob             = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_Dob))
        LoggedInUser.shared.gender          = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_Gender))
        LoggedInUser.shared.userImage       = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_UserImage))
    }
    
    func saveValuesInUserDefaultFromSharedInstance() {
        UserDefaults.standard.set(LoggedInUser.shared.id, forKey: kAPI_Id)
        UserDefaults.standard.set(LoggedInUser.shared.firstName, forKey: kAPI_FirstName)
        UserDefaults.standard.set(LoggedInUser.shared.lastName, forKey: kAPI_LastName)
        UserDefaults.standard.set(LoggedInUser.shared.email, forKey: kAPI_Email)
        UserDefaults.standard.set(LoggedInUser.shared.dob, forKey: kAPI_Dob)
        UserDefaults.standard.set(LoggedInUser.shared.gender, forKey: kAPI_Gender)
        UserDefaults.standard.set(LoggedInUser.shared.userImage, forKey: kAPI_UserImage)
    }
    
    func clearUserData() {
        UserDefaults.standard.set(false, forKey: Key_UD_IsUserLoggedIn)
        
        LoggedInUser.shared.isUserLoggedIn   = false
    }
    
}
