//
//  LoginModel.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation
import FirebaseAuth

struct User: Codable, Equatable {
    
    var id: String = ""
    var username: String = ""
    var email: String = ""
    var pushId: String = ""
    var avatar: String
    var status: String
    
    static var currentId: String {
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    static var currentUser: User? {
//        if Auth.auth().currentUser != nil {
//            if let dict = UserDefaults.standard.data(forKey: CURRENT_USER) {
//                let decoder = JSONDecoder()
//
//                do {
//                    let oject = try decoder.decode(User.self, from: dict)
//                    return oject
//                } catch {
//                    print("Error decoding user from user default")
//                }
//            }
//        }
        
        return nil
    }
    
    static func isCompare(lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}

func saveUserToLocal(_ user: User) {
//    let encoder = JSONEncoder()
//    
//    do {
//        let data = try encoder.encode(user)
//        UserDefaults.standard.set(data, forKey: CURRENT_USER)
//    } catch {
//        print("Error saving user to local")
//    }
}

class LoginModel: LoginContract.Model {
    
}
