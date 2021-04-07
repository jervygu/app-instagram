//
//  HomeVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        
        
        // debug
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("error signing out")
//        }
    }
    
    func handleNotAuthenticated() {
        // check auth status
        if Auth.auth().currentUser == nil {
            // show loginVC
            let loginVC = LoginVC()
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false, completion: nil)
        }
    }

}

