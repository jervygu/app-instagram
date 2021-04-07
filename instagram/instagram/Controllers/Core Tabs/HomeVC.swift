//
//  HomeVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit
import FirebaseAuth

class HomeVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(IGFeedStoryCell.self, forCellReuseIdentifier: IGFeedStoryCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        
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

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! IGFeedStoryCell
        
        return cell
    }
    
    
}

