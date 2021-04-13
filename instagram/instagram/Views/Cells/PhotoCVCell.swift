//
//  PhotoCVCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/8/21.
//

import UIKit
import SDWebImage

class PhotoCVCell: UICollectionViewCell {
    static let identifier = "PhotoCVCell"
    
    private let photoImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImgView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImgView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImgView)
        contentView.clipsToBounds = true
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(withModel model: UserPost ) {
        let url = model.thumbnailImg
        
        photoImgView.sd_setImage(with: url, completed: nil)
    }
    
    public func configure(wtihImgName imageName: String ) {
        photoImgView.image = UIImage(named: imageName)
    }
    
}
