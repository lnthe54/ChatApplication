//
//  FbUserListener.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class FbUserListener {
    
    static let shared = FbUserListener()
    
    private init() {}
    
    // MARK: - Login
    
    // MARK: - Register
    func registerUser(withEmail email: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                
                // Send email verify
                result?.user.sendEmailVerification(completion: { error in
                    print("Auth email sent with error: ", error?.localizedDescription ?? "")
                })
                
                // Create user and Save user
                guard let userFb = result?.user else { return }
                let user = User(id: userFb.uid, username: email, email: email, pushId: "", avatar: "", status: "Hey there")
                
                saveUserToLocal(user)
            }
            completion(error)
        }
    }
}
