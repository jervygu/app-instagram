//
//  AuthManager.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // Mark: - Public
    
    public func registerNewUser(withUsername username: String, withEmail email: String, withPassword password: String, completion: @escaping(Bool) -> Void) {
        /*
         - check if username is available
         - check if email is available
         - create account
         - insert account to database
         */
        
        DatabaseManager.shared.canCreateNewUser(withEmail: email, withUsername: username) { (canCreate) in
            if canCreate {
                // - create account
                // - insert account to database
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    // - insert into database
                    DatabaseManager.shared.insertNewUser(withEmail: email, withUsername: username) { (inserted) in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // failed to insert to database
                            completion(false)
                            return
                        }
                    }
                    
                    
                }
            } else {
                // either username or email does not exist
                completion(false)
            }
            
        }
        
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void)  {
        if let email = email {
            // email login
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            // username login
            print(username)
        }
    }
    
    /// Attempt to logout firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}
