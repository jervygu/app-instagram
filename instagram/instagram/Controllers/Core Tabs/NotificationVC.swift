//
//  NotificationVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit

class NotificationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        title = "Notifications"
        navigationController?.navigationBar.topItem?.title = "Activity"
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }

}
