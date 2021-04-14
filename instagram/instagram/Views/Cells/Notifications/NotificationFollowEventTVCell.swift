//
//  NotificationFollowEventTVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/14/21.
//

import UIKit

protocol NotificationFollowEventTVCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model: String)
}

class NotificationFollowEventTVCell: UITableViewCell {
    static let identifier = "NotificationFollowEventTVCell"
    
    weak var delegate: NotificationFollowEventTVCellDelegate?
    
    private let profileImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()
    
    private let followBtn: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubview(profileImgView)
        contentView.addSubview(label)
        contentView.addSubview(followBtn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(withModel model: String) {
        
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
        
    }
    

}
