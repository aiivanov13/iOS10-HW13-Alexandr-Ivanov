//
//  GeneralTableViewCell.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 24.06.2023.
//

import UIKit
import SnapKit

class GeneralTableViewCell: UITableViewCell {
    var option: Option? {
        didSet {
            icon.image = option?.image
            imageContainer.backgroundColor = option?.iconBackgroundColor
            name.text = option?.name
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
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.option = nil
    }
}
