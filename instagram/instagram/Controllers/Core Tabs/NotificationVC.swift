//
//  NotificationVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit

enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: FollowState)
}

struct UserNotification {
    let type: UserNotificationType
    let text: String
//    let profilePic: URL
    let user: User
}


final class NotificationVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationLikeEventTVCell.self, forCellReuseIdentifier: NotificationLikeEventTVCell.identifier)
        tableView.register(NotificationFollowEventTVCell.self, forCellReuseIdentifier: NotificationFollowEventTVCell.identifier)
        
        
        return tableView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
        
    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNotifications()

        navigationItem.title = "Notifications "
        view.backgroundColor = .systemBackground
        
        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func fetchNotifications() {
        for x in 0...30 {
            let post = UserPost(identifier: "",
                                postType: .photo,
                                thumbnailImg: URL(string: "https://www.google.com/")!,
                                postUrl: URL(string: "https://www.google.com")!,
                                caption: nil,
                                likeCount: [],
                                comment: [],
                                createdDate: Date(),
                                taggedUsers: [])
            
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow(state: .not_following),
                                         text: "Hellow instagrammer",
                                         user: User(username: "jervygu",
                                                    bio: "Capture it",
                                                    name: (first: "Jervy", last: "GU"),
                                                    profilePhoto: URL(string: "https://www.google.com")!,
                                                    birthDate: Date(),
                                                    gender: .female,
                                                    counts: UserCount(followers: 124,
                                                                      following: 156,
                                                                      posts: 1228),
                                                    joinDate: Date()))
            
            models.append(model)
        }
    }
    
    private func addNoNotificationsView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/4)
        noNotificationsView.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        switch model.type {
        case .like(_):
            // like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTVCell.identifier, for: indexPath) as! NotificationLikeEventTVCell
            
            cell.configure(withModel: model)
            cell.delegate = self
            
            return cell
        case .follow:
            // follow cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTVCell.identifier, for: indexPath) as! NotificationFollowEventTVCell
            
//            cell.configure(withModel: model)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }

}

extension NotificationVC: NotificationLikeEventTVCellDelegate {
    func didTapRelatedPostButton(model: UserNotification) {
        // Open post
        print("Tapped post")
        
    }
    
    
}

extension NotificationVC: NotificationFollowEventTVCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotification) {
        // Open Notif
        print("Tapped Follow Button")
    }
    
    
    
    
}
