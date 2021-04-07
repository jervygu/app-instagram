//
//  IGFeedStoryCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/7/21.
//

import UIKit

final class IGFeedStoryCell: UITableViewCell {
    
    static let identifier = "IGFeedStoryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure cell
    }
}
