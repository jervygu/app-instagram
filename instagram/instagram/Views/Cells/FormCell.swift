//
//  FormCell.swift
//  instagram
//
//  Created by Jeff Umandap on 4/8/21.
//

import UIKit

protocol FormCellDelegate: AnyObject {
    func formCell(_ cell: FormCell, didUpdateFieldWith updatedModel: EditProfileFormModel)
}

class FormCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormCell"
    
    private var model: EditProfileFormModel?
    
    public weak var delegate: FormCellDelegate?
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        
        field.delegate = self
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(withModel model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeHolder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // assign frames
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width / 3,
                                 height: contentView.height)
        
        field.frame = CGRect(x: formLabel.right + 5,
                             y: 0,
                             width: contentView.width - 10 - formLabel.width,
                             height: contentView.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        delegate?.formCell(self, didUpdateFieldWith: model)
        
        textField.resignFirstResponder()
        
        return true
    }
}
