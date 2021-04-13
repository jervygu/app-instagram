//
//  ListVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit

class ListVC: UIViewController {
    
    private let data: [String]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserFollowTVCell.self, forCellReuseIdentifier: UserFollowTVCell.identifier)
        return tableView
    }()
    
    init(data: [String]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTVCell.identifier, for: indexPath) as! UserFollowTVCell
        
//        cell.textLabel?.text = data[indexPath.row]
        cell.configure(withModel: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // got to profile of selected cell
        let model = data[indexPath.row]
    }
    
    
}
