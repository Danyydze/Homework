//
//  ViewController.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Basic UI elements
    
    private let leadingInset: CGFloat = 16
    
    private lazy var mainInfoLabel: (String, CGFloat) -> UILabel = { content, size in
        let label = UILabel()
        label.font = .systemFont(ofSize: size, weight: .medium)
        label.text = content
        return label
    }
    
    private lazy var subInfoLabel: (String) -> UILabel = {content in
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
        
    }
    
    private lazy var profilePie: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return imageView
    }()

    //MARK: User info entries
    
    private lazy var sex = UserInfoEntery(heading: "Sex", info:"Man")
    private lazy var work = UserInfoEntery(heading: "WORK", info:"iOS - developer")
    
    //MARK: Family member enteries
    
    private lazy var husband = FamilyMemberEntery(member: "Wife", name: "Carla", birthdate: "01.04.1981")
    private lazy var children1 = FamilyMemberEntery(member: "Child", name: "Maksim", birthdate: "25.12.2003")
    private lazy var children2 = FamilyMemberEntery(member: "Child", name: "Sveta", birthdate: "13.03.2004")
    private lazy var father = FamilyMemberEntery(member: "Father", name: "Patrik", birthdate: "12.12.1930")
    private lazy var mother = FamilyMemberEntery(member: "Mother", name: "Patricia", birthdate: "30.01.1945")
    
    //MARK: Definition of headStackView
    
    private lazy var headStackView: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        
        verticalStack.addArrangedSubview(self.mainInfoLabel("John Dolbik", 17))
        verticalStack.addArrangedSubview(self.subInfoLabel("01.01.1970"))
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(profilePie)
        
        return horizontalStack
    }()
    
    // MARK: Definition of InfoStacks
    
    private lazy var userInfoStackView = InfoStackView()
    private lazy var familyInfoStackView = InfoStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHeadStack()
        setupUserInfoStack()
        setupFamilyInfoStack()
    }
    

    private func setupHeadStack() {
        view.addSubview(headStackView)
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset)
        ])
    }
    
    private func setupUserInfoStack() {
        view.addSubview(userInfoStackView)
        
        [mainInfoLabel("User info", 19), sex, work, subInfoLabel("Family"), familyInfoStackView].forEach{
            userInfoStackView.addArrangedSubview($0)}
        userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInfoStackView.topAnchor.constraint(equalTo: headStackView.bottomAnchor, constant: 60),
            userInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset)
        ])
    }
    
    private func setupFamilyInfoStack() {
        [husband, children1, children2, father, mother].forEach{ familyInfoStackView.addArrangedSubview($0)}
    }
    

}

