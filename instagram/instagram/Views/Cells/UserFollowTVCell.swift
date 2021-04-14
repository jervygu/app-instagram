//
//  UserFollowTVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/13/21.
//

import UIKit

protocol UserFollowTVCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model: UserRelationship)
}

enum FollowState {
    case following // indicates the current user is following the other user
    case not_following // indicates the current user is NOT following the other user
}

struct UserRelationship {
    let username: String
    let name: String
    let type: FollowState
}

class UserFollowTVCell: UITableViewCell {
    
    
    
    static let identifier = "UserFollowTVCell"
    
    weak var delegate: UserFollowTVCellDelegate?
    
    private var model: UserRelationship?
    
    private let profileImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        
        imageView.backgroundColor = .secondarySystemBackground
        
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let usernameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        
        label.text = "jervygu"
        
        return label
    }()
    
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Wanda Maximoff Scarlet Witch"
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let followBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(nameLbl)
        contentView.addSubview(usernameLbl)
        contentView.addSubview(profileImgView)
        contentView.addSubview(followBtn)
        selectionStyle = .none
        
        followBtn.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
    }
    
    @objc private func didTapFollowButton() {
        
        guard let model = model else {
            return
        }
        
        delegate?.didTapFollowUnFollowButton(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    public func configure(withModel model: UserRelationship) {
        
        self.model = model
        
        nameLbl.text = model.name
        usernameLbl.text = model.username
        
        switch model.type {
        case .following:
            // show unfollow button
            followBtn.setTitle("Unfollow", for: .normal)
            followBtn.setTitleColor(.label, for: .normal)
            followBtn.backgroundColor = .systemBackground
            followBtn.layer.borderWidth = 0.5
            followBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case .not_following:
            // show follow button
            followBtn.setTitle("Follow", for: .normal)
            followBtn.setTitleColor(.white , for: .normal)
            followBtn.backgroundColor = .link
            followBtn.layer.borderWidth = 0
//            followBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImgView.image = nil
        nameLbl.text = nil
        usernameLbl.text = nil
        followBtn.setTitle(nil, for: .normal)
        followBtn.layer.borderWidth = 0
        followBtn.backgroundColor = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImgView.frame = CGRect(x: 15,
                                      y: 3,
                                      width: contentView.height - 6,
                                      height: contentView.height - 6)
        profileImgView.layer.cornerRadius = profileImgView.height / 2.0
        
        let buttonWidth = contentView.width > 500 ? 220.0 : contentView.width / 4
        
        followBtn.frame = CGRect(x: contentView.width - buttonWidth - 15,
                                 y: (75 - 30) / 2,
                                 width: buttonWidth,
                                 height: 30)
        
        let labelHeight = contentView.height / 4
        usernameLbl.frame = CGRect(x: profileImgView.right + 5,
                                   y: contentView.height / 4,
                                   width: contentView.width - profileImgView.width - buttonWidth - 40,
                                   height: labelHeight)
        
        nameLbl.frame = CGRect(x: profileImgView.right +  5,
                               y: usernameLbl.bottom + 5,
                               width: contentView.width - profileImgView.width - buttonWidth - 40,
                               height: labelHeight)
        
        
        
        
        
    }
    
}
