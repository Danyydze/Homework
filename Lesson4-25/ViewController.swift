//
//  ViewController.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private var customTableView: CustomTableView!
    
    // MARK: - Data
    private let userInfo = userInfoData
    private let familyMembers = familyMembersData
    private let profileImageView = UIImageView()
    private let mainInfoLabel = UILabel()
    private let subInfoLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ViewColor")
        setupInfoStackView()
        setupCustomTableView()
    }
    
    // MARK: - Setup Methods
    private func setupInfoStackView() {
        let infoStackView = InfoStackView()
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 100
        
        mainInfoLabel.text = "John Dolbik"
        mainInfoLabel.textColor = .black
        mainInfoLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        subInfoLabel.text = "01.01.1970"
        subInfoLabel.font = UIFont.systemFont(ofSize: 17)
        subInfoLabel.textColor = .gray
        
        infoStackView.addArrangedSubview(mainInfoLabel)
        infoStackView.addArrangedSubview(subInfoLabel)
        
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .white
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 15
        
        horizontalStack.addArrangedSubview(infoStackView)
        horizontalStack.addArrangedSubview(profileImageView)
        
        view.addSubview(horizontalStack)
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            horizontalStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCustomTableView() {
        customTableView = CustomTableView(frame: .zero)
        
        customTableView.userInfo = userInfo
        customTableView.familyMembers = familyMembers
        
        view.addSubview(customTableView)
        
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let rowHeight: CGFloat = 75
        let totalRows = userInfo.count + familyMembers.count
        let tableHeight = rowHeight * CGFloat(totalRows) + 45
        
        NSLayoutConstraint.activate([
            customTableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            customTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            customTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            customTableView.heightAnchor.constraint(equalToConstant: tableHeight)
        ])
    }
}
