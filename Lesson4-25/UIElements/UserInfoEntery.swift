//
//  UserInfoEntery.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//

import UIKit

final class UserInfoEntery: UIStackView {
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    init(heading: String, info: String) {
        super.init(frame: .zero)
        headingLabel.text = heading
        infoLabel.text = info
        setupLayout()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        axis = .vertical
        
        [headingLabel, infoLabel].forEach{ addArrangedSubview($0)}
    }
}
