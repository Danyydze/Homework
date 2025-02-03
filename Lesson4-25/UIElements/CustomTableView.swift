//
//  CustomTableView.swift
//  Lesson4-25
//
//  Created by Данил Марков on 03.02.2025.
//

import UIKit

class CustomTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    private let userInfoTableView = UITableView()
    private let familyInfoTableView = UITableView()
    
    var userInfo: [UserInfo] = []
    var familyMembers: [FamilyMember] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInfoTableView()
        setupFamilyInfoTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setupUserInfoTableView() {
        userInfoTableView.dataSource = self
        userInfoTableView.delegate = self
        userInfoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "userInfoCell")
        userInfoTableView.backgroundColor = .clear
        userInfoTableView.isScrollEnabled = false
        userInfoTableView.rowHeight = 75
        userInfoTableView.separatorStyle = .none

        addSubview(userInfoTableView)
        userInfoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userInfoTableView.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            userInfoTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userInfoTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
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

        addSubview(familyInfoTableView)
        familyInfoTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            familyInfoTableView.topAnchor.constraint(equalTo: userInfoTableView.bottomAnchor, constant: 20),
            familyInfoTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            familyInfoTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            familyInfoTableView.heightAnchor.constraint(equalToConstant: familyInfoTableView.rowHeight * CGFloat(familyMembers.count) + 45)
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
        }else { // User Info Table View
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

    // MARK: - UITableDelegate Methods
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }


    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
}
