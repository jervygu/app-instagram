//
//  NotificationLikeEventTVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/14/21.
//

import UIKit
import SDWebImage

protocol NotificationLikeEventTVCellDelegate: AnyObject {
    func didTapRelatedPostButton(model: UserNotification)
}

class NotificationLikeEventTVCell: UITableViewCell {
    static let identifier = "NotificationLikeEventTVCell"
    
    weak var delegate: NotificationLikeEventTVCellDelegate?
    
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
        
        label.text = "Wanda Maximoff Scarlet Witch liked your post."
        
        return label
    }()
    
    private let postBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "test"), for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubview(profileImgView)
        contentView.addSubview(label)
        contentView.addSubview(postBtn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(withModel model: UserNotification) {
        self.model = model
        
        
        
        switch model.type {
        case .like(let post):
            let thumbnail = post.thumbnailImg
            
            guard !thumbnail.absoluteString.contains("google.com") else {
                return
            }
            
            postBtn.sd_setBackgroundImage(with: thumbnail, for: .normal, completed: nil)
        case .follow:
            break
        }
        
        label.text = model.text
        profileImgView.sd_setImage(with: model.user.profilePhoto, completed: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postBtn.setBackgroundImage(nil, for: .normal)
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
        postBtn.frame = CGRect(x: contentView.width-size-15, y: 2, width: size, height: size)
        
        label.frame = CGRect(x: profileImgView.right+5,
                             y: 0,
                             width: contentView.width-size-profileImgView.width-35,
                             height: contentView.height)
        
    }
    

}
