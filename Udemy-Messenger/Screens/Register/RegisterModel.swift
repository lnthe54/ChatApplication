//
//  RegisterModel.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseDatabase

class RegisterModel: RegisterContract.Model {
    
    private let limitNumberPassword: Int = 6
    private let limitNumberName: Int = 30
    
    func validateFields(email: String, name: String, password: String) -> String {
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty
            || name.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty
            || password.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty {
                    return "Please, make sure you have filled out all the information."
                }
        
        if password.count < limitNumberPassword {
            return "Passwords must be at least 6 characters."
        }
        
        if name.count > limitNumberName {
            return "Your name exceeds 30 characters."
        }
        
        if !email.isValidEmail() {
            return "Invalid email format."
        }
        
        return String.empty
    }
    
    func checkForExistingEmail(_ email: String, completion: @escaping (_ errorMessage: String) -> Void) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
            if methods == nil {
                return completion(String.empty)
            } else {
                return completion("Email is exists.")
            }
        }
    }
    
    func registerUser(_ name: String, email: String, password: String, completion: @escaping (_ errorMessage: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (dataResult, error) in
            guard let self = self else {
                return
            }
            
            if let error = error {
                return completion(error.localizedDescription)
            }
            
            guard let uid = dataResult?.user.uid else {
                return completion("Error occured, try again!")
            }
            
            let values: [String: Any] = [
                "name": name,
                "email": email,
            ]
            
            self.registerUserHandler(uid, values: values) { error in
                completion(error?.localizedDescription ?? String.empty)
            }
        }
    }
    
    func registerUserHandler(_ uid: String, values: [String:Any], completion: @escaping (_ error: Error?) -> Void) {
        let usersRef = Database.database().reference().child(Constants.USERS_REF).child(uid)
        
        usersRef.updateChildValues(values) { (error, dataRef) in
            completion(error)
        }
    }
}
