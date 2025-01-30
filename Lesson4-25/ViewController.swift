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
    
    private lazy var sex = UserInfoEntery(heading: "SEX", info:"Dima")
    
    //MARK: Definition of headStackView
    
    private lazy var headStackView: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        
        verticalStack.addArrangedSubview(self.mainInfoLabel("John Dob", 17))
        verticalStack.addArrangedSubview(self.subInfoLabel("01.01.1970"))
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(profilePie)
        
        return horizontalStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHeadStack()
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

}

