//
//  DatabaseManager.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(withEmail email: String, withUsername username: String, completion:(Bool) -> Void) {
        
        completion(true)
    }
    
    /// Insert new user data to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeeded
    public func insertNewUser(withEmail email: String, withUsername username: String, completion: @escaping(Bool) -> Void) {
        
        let emailKey = email.safeDatabaseKey()
        print(emailKey)
        
        database.child(emailKey).setValue(["username": username]) { (error, snapshot) in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
    
    
    
}



