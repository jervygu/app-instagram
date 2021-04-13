//
//  ProfileTabsCollectionReusableView.swift
//  instagram
//
//  Created by Jeff Umandap on 4/8/21.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject {
    func didTapGridBtnTab()
    func didTapTaggedBtnTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants {
        static let padding: CGFloat = 8.0
    }
    
    private let gridBtn: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .label
        button.setBackgroundImage(UIImage(systemName: "rectangle.split.3x3"), for: .normal)
        
        return button
    }()
    
    let gridIndicatorView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .label
        
        return view
    }()
    
    private let taggedBtn: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .secondaryLabel
        button.setBackgroundImage(UIImage(systemName: "person.crop.square"), for: .normal)
        
        return button
    }()
    
    let taggedIndicatorView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        addSubview(gridBtn)
        addSubview(taggedBtn)
        addSubview(gridIndicatorView)
        addSubview(taggedIndicatorView)
        
        gridBtn.addTarget(self, action: #selector(didTapGridBtnTab), for: .touchUpInside)
        taggedBtn.addTarget(self, action: #selector(didTapTaggedBtnTab), for: .touchUpInside)
    }
    
    @objc private func didTapGridBtnTab() {
        gridBtn.tintColor =  .label
        taggedBtn.tintColor = .secondaryLabel
        
        gridIndicatorView.backgroundColor = .label
        taggedIndicatorView.backgroundColor = .systemBackground
        delegate?.didTapGridBtnTab()
        
    }
    
    @objc private func didTapTaggedBtnTab() {
        gridBtn.tintColor =  .secondaryLabel
        taggedBtn.tintColor = .label
        
        gridIndicatorView.backgroundColor = .systemBackground
        taggedIndicatorView.backgroundColor = .label
        delegate?.didTapTaggedBtnTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        let size = height - (Constants.padding * 2)
        let gridButtonX = ((width / 2) - size) / 2
        
        
        gridBtn.frame = CGRect(x: gridButtonX, y: Constants.padding, width: size, height: size - 4)
        taggedBtn.frame = CGRect(x: gridButtonX + (width / 2), y: Constants.padding, width: size, height: size - 4)
        
        gridIndicatorView.frame = CGRect(x: 0, y: gridBtn.bottom + 8, width: width / 2, height: 1)
        taggedIndicatorView.frame = CGRect(x: gridIndicatorView.right, y: taggedBtn.bottom + 8, width: width / 2, height: 1)
        
    }
    
    
}
