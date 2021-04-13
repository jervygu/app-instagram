//
//  UserFollowTVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/13/21.
//

import UIKit

protocol UserFollowTVCellDelegate: AnyObject {
    func didTapFollowUnFollowButton(model: String)
}

class UserFollowTVCell: UITableViewCell {
    
    static let identifier = "UserFollowTVCell"
    
    weak var delegate: UserFollowTVCellDelegate?
    
    private let profileImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        
        return imageView
    }()
    
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }()
    
    private let usernameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    private let followBtn: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(nameLbl)
        contentView.addSubview(usernameLbl)
        contentView.addSubview(profileImgView)
        contentView.addSubview(followBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(withModel model: String) {
        
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
        
    }
    
}
