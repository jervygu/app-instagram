//
//  NotificationFollowEventTVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/14/21.
//

import UIKit

protocol NotificationFollowEventTVCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model: UserNotification)
}

class NotificationFollowEventTVCell: UITableViewCell {
    static let identifier = "NotificationFollowEventTVCell"
    
    weak var delegate: NotificationFollowEventTVCellDelegate?
    
    private var model: UserNotification?
    
    private let profileImgView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        
        label.text = "tome_yamnnatome_yamnna started following you."
        
        return label
    }()
    
    private let followBtn: UIButton = {
        let button = UIButton()
        
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.layer.cornerRadius = 5.0
        button.layer.masksToBounds = true
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubview(profileImgView)
        contentView.addSubview(label)
        contentView.addSubview(followBtn)
        followBtn.addTarget(self, action: #selector(didTapFollowBtn), for: .touchUpInside)
        
        configureForFollow()
        selectionStyle = .none
        
    }
    
    @objc private func didTapFollowBtn() {
        guard let model = model else {
            return
        }
        delegate?.didTapFollowUnFollowButton(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(withModel model: UserNotification) {
        self.model = model
        
        switch model.type {
        case .like(_):
            break
        case .follow(let state):
            // configure model
            switch state {
            case .following:
                // show unfollow button
                configureForFollow()
            case .not_following:
                // show follow button
                followBtn.setTitle("Follow", for: .normal)
                followBtn.setTitleColor(.white , for: .normal)
                followBtn.backgroundColor = .link
                followBtn.layer.borderWidth = 0
            }
            break
        }
        
        label.text = model.text
        profileImgView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    private func configureForFollow() {
        followBtn.setTitle("Unfollow", for: .normal)
        followBtn.setTitleColor(.label, for: .normal)
        followBtn.backgroundColor = .systemBackground
        followBtn.layer.borderWidth = 0.5
        followBtn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        followBtn.setTitle(nil, for: .normal)
        followBtn.backgroundColor = nil
        followBtn.layer.borderWidth = 0
        label.text = nil
        profileImgView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // photo, text, post button
        profileImgView.frame = CGRect(x: 15,
                                      y: 3,
                                      width: contentView.height-6,
                                      height: contentView.height-6)
        profileImgView.layer.cornerRadius = profileImgView.height/2
        
        let size = contentView.height-4
        
        let buttonWidth = contentView.width > 500 ? 220.0 : contentView.width / 4
        let buttonHeight: CGFloat = 30
        
        followBtn.frame = CGRect(x: contentView.width - buttonWidth - 15,
                                 y: (contentView.height-buttonHeight)/2,
                                 width: buttonWidth,
                                 height: buttonHeight)
        
        label.frame = CGRect(x: profileImgView.right+5,
                             y: 0,
                             width: contentView.width-size-profileImgView.width-45,
                             height: contentView.height)
        
        
    }
    

}
