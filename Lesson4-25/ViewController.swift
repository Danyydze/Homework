//
//  ViewController.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - UI Elements
    private let userInfoTableView = UITableView(frame: .zero, style: .insetGrouped)
    private let familyInfoTableView = UITableView(frame: .zero, style: .insetGrouped)

    // MARK: - Data
    private let userInfo = userInfoData
    private let familyMembers = familyMembersData
    private let profileImageView = UIImageView()
    private let mainInfoLabel = UILabel()
    private let subInfoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ViewColor")
        setupUserInfoTableView()
        setupFamilyInfoTableView()
        setupInfoStackView()
        
        userInfoTableView.isUserInteractionEnabled = false
        familyInfoTableView.isUserInteractionEnabled = false
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
        infoStackView.addArrangedSubview(subInfoLabel);
        
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
    
    private func setupUserInfoTableView() {
        userInfoTableView.dataSource = self
        userInfoTableView.delegate = self
        userInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "userInfoCell")
        userInfoTableView.backgroundColor = .clear
        userInfoTableView.isScrollEnabled = false
        userInfoTableView.rowHeight = 75
        userInfoTableView.separatorStyle = .none

        view.addSubview(userInfoTableView)
        userInfoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userInfoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            userInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            userInfoTableView.heightAnchor.constraint(equalToConstant: userInfoTableView.rowHeight * CGFloat(userInfo.count) + 45)
        ])
    }

    private func setupFamilyInfoTableView() {
        familyInfoTableView.dataSource = self
        familyInfoTableView.delegate = self
        familyInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "familyInfoCell")
        familyInfoTableView.backgroundColor = .clear
        familyInfoTableView.isScrollEnabled = false
        familyInfoTableView.rowHeight = 75
        familyInfoTableView.separatorStyle = .none

        view.addSubview(familyInfoTableView)
        familyInfoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            familyInfoTableView.topAnchor.constraint(equalTo: userInfoTableView.bottomAnchor, constant: 20),
            familyInfoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            familyInfoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            familyInfoTableView.heightAnchor.constraint(equalToConstant: familyInfoTableView.rowHeight * CGFloat(familyMembers.count) + 45) // Высота с учетом отступа снизу
        ])
    }

    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == userInfoTableView {
            return userInfo.count
        } else if tableView == familyInfoTableView {
            return familyMembers.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = tableView == userInfoTableView ? "userInfoCell" : "familyInfoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        if tableView == familyInfoTableView {
            let member = familyMembers[indexPath.row]
            
            let roleLabel = UILabel()
            roleLabel.text = member.role
            roleLabel.font = .systemFont(ofSize: 17, weight: .bold)
            roleLabel.translatesAutoresizingMaskIntoConstraints = false

            let nameAndBirthLabel = UILabel()
            nameAndBirthLabel.text = "\(member.name), \(member.birthDate)"
            nameAndBirthLabel.font = .systemFont(ofSize: 23, weight: .regular)
            nameAndBirthLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let stackView = UIStackView(arrangedSubviews: [roleLabel, nameAndBirthLabel])
            stackView.axis = .vertical
            stackView.spacing = 4
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            cell.contentView.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                stackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10)
            ])
        } else {
            let member = userInfo[indexPath.row]

            let roleLabel = UILabel()
            roleLabel.text = member.title
            roleLabel.font = .systemFont(ofSize: 17, weight: .bold)
            roleLabel.translatesAutoresizingMaskIntoConstraints = false

            let nameAndBirthLabel = UILabel()
            nameAndBirthLabel.text = "\(member.value)"
            nameAndBirthLabel.font = .systemFont(ofSize: 23, weight: .regular)
            nameAndBirthLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let stackView = UIStackView(arrangedSubviews: [roleLabel, nameAndBirthLabel])
            stackView.axis = .vertical
            stackView.spacing = 4
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            cell.contentView.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                stackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10)
            ])
        }

        cell.backgroundColor = .white
        return cell
    }


    // MARK: - Radius Table
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        let radius: CGFloat = 10
        
        cell.separatorInset = UIEdgeInsets(
            top: 0,
            left: indexPath.row == numberOfRows - 1 ? 0 : 20,
            bottom: 0,
            right: 0
        )
        
        var maskedCorners: CACornerMask = []
        
        if indexPath.row == 0 {
            maskedCorners.formUnion([.layerMinXMinYCorner, .layerMaxXMinYCorner])
        }
        if indexPath.row == numberOfRows - 1 {
            maskedCorners.formUnion([.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        }
        
        cell.layer.cornerRadius = maskedCorners.isEmpty ? 0 : radius
        cell.layer.maskedCorners = maskedCorners
        cell.layer.masksToBounds = true
    }
    
    // MARK: - Heading label
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear

        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .gray
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1

        if tableView == userInfoTableView {
            titleLabel.text = "User Information"
        } else if tableView == familyInfoTableView {
            titleLabel.text = "Family Members"
        }

        headerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }


    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
