//
//  infoStackView.swift
//  Lesson4-25
//
//  Created by Данил Марков on 30.01.2025.
//
import UIKit

class InfoStackView: UIStackView {
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("inir(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        axis = .vertical
        spacing = 16
    }
}
