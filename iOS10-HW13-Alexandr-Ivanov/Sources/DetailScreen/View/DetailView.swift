//
//  DetailView.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 12.07.2023.
//

import UIKit
import SnapKit

final class DetailView: UIView {
    
    // MARK: - Outlets

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.0
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.alpha = 0.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(infoView)
        infoView.addSubview(button)
        infoView.addSubview(titleLabel)
        addSubview(imageView)
    }

    private func setupLayout() {
        infoView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(self.snp_centerYWithinMargins)
        }

        button.snp.makeConstraints { make in
            make.left.right.equalTo(infoView).inset(20)
            make.bottom.equalTo(infoView.snp_bottomMargin).inset(20)
            make.height.equalTo(50)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.right.top.equalTo(infoView).inset(20)
        }

        imageView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(100)
            make.height.equalTo(imageView.snp.width)
            make.centerY.equalTo(self.snp_centerYWithinMargins).dividedBy(2)
        }
    }
}
