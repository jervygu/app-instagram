//
//  EditProfileVC.swift
//  instagram
//
//  Created by Jeff Umandap on 4/6/21.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeHolder: String
    var value: String?
}

final class EditProfileVC: UIViewController, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormCell.self, forCellReuseIdentifier: FormCell.identifier)
        
        return tableView
    }()

    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
        
        tableView.dataSource = self
        tableView.tableHeaderView = createTableHeaderView()
        
        
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        // name, username, website, bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeHolder: "Enter \(label)", value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    
    // TableView
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(
                                x: 0,
                                y: 0,
                                width: view.width,
                                height: view.height / 4).integral)
        
        let size = header.height / 1.5
        
        let profilePhotoBtn = UIButton(frame: CGRect(
                                        x: (view.width - size) / 2,
                                        y: (header.height - size) / 2,
                                        width: size,
                                        height: size).integral)
        header.addSubview(profilePhotoBtn)
        profilePhotoBtn.layer.masksToBounds = true
        profilePhotoBtn.layer.cornerRadius = size / 2.0
        profilePhotoBtn.layer.borderWidth = 1.0
        profilePhotoBtn.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        profilePhotoBtn.tintColor = .label
        profilePhotoBtn.addTarget(self,
                                  action: #selector(didTapProfilePhotoBtn),
                                  for: .touchUpInside)
        profilePhotoBtn.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        
        return header
    }
    
    @objc private func didTapProfilePhotoBtn() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormCell.identifier, for: indexPath) as! FormCell
        cell.configure(withModel: model)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    // Actions
    
    @objc private func didTapSave() {
        // save info to database
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (action) in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { (action) in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true, completion: nil)
    }

    
    
    
}

extension EditProfileVC: FormCellDelegate {
    
    func formCell(_ cell: FormCell, didUpdateFieldWith updatedModel: EditProfileFormModel) {
        // update model
        print(updatedModel.label)
        print(updatedModel.value ?? "nil")
    }
    
    
}
