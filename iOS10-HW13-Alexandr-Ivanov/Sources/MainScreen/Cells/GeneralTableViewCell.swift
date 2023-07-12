//
//  GeneralTableViewCell.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 24.06.2023.
//

import UIKit
import SnapKit

class GeneralTableViewCell: UITableViewCell {
    class var identifier: String { "general" }
    
    var option: Option? {
        didSet {
            icon.image = option?.image
            imageContainer.backgroundColor = option?.iconBackgroundColor
            name.text = option?.name
            notificationView.isHidden = option?.notificationsIsHidden ?? true
        }
    }
    
    // MARK: - Outlets
    
    private let imageContainer: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 7
        return container
    }()
    
    private let icon: UIImageView = {
        let iconView = UIImageView()
        iconView.backgroundColor = .clear
        iconView.tintColor = .white
        iconView.contentMode = .scaleAspectFit
        iconView.clipsToBounds = true
        return iconView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.contentMode = .center
        label.textColor = .white
        return label
    }()
    
    private let notificationView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        imageContainer.addSubview(icon)
        addSubview(imageContainer)
        addSubview(name)
        notificationView.addSubview(countLabel)
        addSubview(notificationView)
        accessoryType = .disclosureIndicator
    }
    
    private func setupLayout() {
        imageContainer.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(15)
        }
        
        icon.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(imageContainer).inset(3)
        }
        
        name.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageContainer.snp.right).offset(15)
            make.right.equalTo(contentView).inset(50)
        }
        
        notificationView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(contentView).inset(20)
            make.height.width.equalTo(24)
        }
        
        countLabel.snp.makeConstraints { make in
            make.center.equalTo(notificationView)
        }
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        notificationView.isHidden = true
    }
}
