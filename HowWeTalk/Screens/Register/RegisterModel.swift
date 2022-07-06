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
    private let loading = NetworkLoading()
    
    func validateFields(email: String, name: String, password: String) -> (isSuccess: Bool, msg: String) {
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty
            || name.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty
            || password.trimmingCharacters(in: .whitespacesAndNewlines) == String.empty {
            return (false, "Please, make sure you have filled out all the information.")
                }
        
        if !email.isValidEmail() {
            return (false, "Invalid email format.")
        }
        
        if name.count > limitNumberName {
            return (false, "Your name exceeds 30 characters.")
        }
        
        if password.count < limitNumberPassword {
            return (false, "Passwords must be at least 6 characters.")
        }
        
        return (true, String.empty)
    }
    
    func checkForExistingEmail(_ email: String, name: String, password: String, completion: @escaping (String) -> Void) {
        loading.startLoading()
        let result = validateFields(email: email, name: name, password: password)
        
        if result.isSuccess {
            Auth.auth().fetchSignInMethods(forEmail: email) { [weak self] (methods, error)in
                guard let self = self else {
                    return
                }
                
                self.loading.endLoading()
                if methods == nil {
                    completion(String.empty)
                } else {
                    completion("Email is exists")
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.loading.endLoading()
                completion(result.msg)
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
