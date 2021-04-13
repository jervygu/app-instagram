//
//  ProfileInfoHeaderCollectionReusableView.swift
//  instagram
//
//  Created by Jeff Umandap on 4/8/21.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton (_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowersButton (_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton (_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton (_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapSavedButton (_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImgView: UIImageView = {
        let imageView = UIImageView()
        //        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "profilePhoto")
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private let postsBtn: UIButton = {
        let button = UIButton()
        
        //applying the line break mode
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "24\nPosts"

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

        //assigning diffrent fonts to both substrings
        let font1: UIFont = .systemFont(ofSize: 15, weight: .bold)
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = .systemFont(ofSize: 12, weight: .regular)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

        //appending both attributed strings
        attrString1.append(attrString2)

        //assigning the resultant attributed strings to the button
        button.setAttributedTitle(attrString1, for: [])
        
        
//        button.setTitle("Posts", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.label, for: .normal)
        //        button.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBackground
        return button
    }()
    
    private let followersBtn: UIButton = {
        let button = UIButton()
        
        //applying the line break mode
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "172\nFollowers"

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

        //assigning diffrent fonts to both substrings
        let font1: UIFont = .systemFont(ofSize: 15, weight: .bold)
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = .systemFont(ofSize: 12, weight: .regular)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

        //appending both attributed strings
        attrString1.append(attrString2)

        //assigning the resultant attributed strings to the button
        button.setAttributedTitle(attrString1, for: [])
        
        
//        button.setTitle("Posts", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.label, for: .normal)
        //        button.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBackground
        return button
    }()
    
    private let followingBtn: UIButton = {
        let button = UIButton()
        
        //applying the line break mode
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "1,039\nFollowing"

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

        //assigning diffrent fonts to both substrings
        let font1: UIFont = .systemFont(ofSize: 15, weight: .bold)
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = .systemFont(ofSize: 12, weight: .regular)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)

        //appending both attributed strings
        attrString1.append(attrString2)

        //assigning the resultant attributed strings to the button
        button.setAttributedTitle(attrString1, for: [])
        
        
//        button.setTitle("Posts", for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.label, for: .normal)
        //        button.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBackground
        return button
    }()
    
    private let editProfileBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.label, for: .normal)
        //        button.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 0.3
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return button
    }()
    
    private let savedBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Saved", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.label, for: .normal)
        //        button.backgroundColor = .secondarySystemBackground
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 5.0
        button.layer.borderWidth = 0.3
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return button
    }()
    
    private let nameLbl: UILabel = {
        let label = UILabel()
        label.text = "Jervy GU"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let bioLbl: UILabel = {
        let label = UILabel()
        label.text = "jervygu.wixsite.com/iosdev"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        addButtonActions()
        
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(profilePhotoImgView)
        addSubview(followersBtn)
        addSubview(followingBtn)
        addSubview(postsBtn)
        addSubview(nameLbl)
        addSubview(bioLbl)
        addSubview(editProfileBtn)
        addSubview(savedBtn)
    }
    
    private func addButtonActions() {
        postsBtn.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        followersBtn.addTarget(self, action: #selector(didTapFollowersButton), for: .touchUpInside)
        followingBtn.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        editProfileBtn.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
        savedBtn.addTarget(self, action: #selector(didTapSavedButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width / 4
        profilePhotoImgView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        
        profilePhotoImgView.layer.cornerRadius = profilePhotoSize / 2.0
        profilePhotoImgView.layer.borderWidth = 1
        profilePhotoImgView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        let buttonHeight = profilePhotoSize
        let countBtnWidth = (width - 10 - profilePhotoSize) / 3
        
        postsBtn.frame = CGRect(x: profilePhotoImgView.right, y: 5, width: countBtnWidth, height: buttonHeight).integral
        
        followersBtn.frame = CGRect(x: postsBtn.right, y: 5, width: countBtnWidth, height: buttonHeight).integral
        
        followingBtn.frame = CGRect(x: followersBtn.right, y: 5, width: countBtnWidth, height: buttonHeight).integral
        
        
        nameLbl.frame = CGRect(x: 15, y: 5 + profilePhotoImgView.bottom, width: width - 10, height: 50).integral
        
        let bioLabelSize = bioLbl.sizeThatFits(frame.size)
        bioLbl.frame = CGRect(x: 15, y: nameLbl.bottom - 10, width: width - 10, height: bioLabelSize.height).integral
        
        
        editProfileBtn.frame = CGRect(x: 15, y: bioLbl.bottom + 15, width: (width / 2) - 17.5, height: buttonHeight / 3).integral
        
        savedBtn.frame = CGRect(x: editProfileBtn.right + 5, y: bioLbl.bottom + 15, width: (width / 2) - 17.5, height: buttonHeight / 3).integral
        
        
        
        
    }
    
    // MARK: - Actions
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    
    @objc private func didTapFollowersButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
    @objc private func didTapSavedButton() {
        delegate?.profileHeaderDidTapSavedButton(self)
    }
    
}
