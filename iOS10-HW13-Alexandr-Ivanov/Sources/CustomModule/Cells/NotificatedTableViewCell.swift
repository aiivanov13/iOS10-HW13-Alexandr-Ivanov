//
//  NotificationTableViewCell.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 24.06.2023.
//

import UIKit

class NotificatedTableViewCell: GeneralTableViewCell {

    // MARK: - Outlets

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
        notificationView.addSubview(countLabel)
        addSubview(notificationView)
    }

    private func setupLayout() {
        notificationView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(contentView).inset(20)
            make.height.width.equalTo(24)
        }

        countLabel.snp.makeConstraints { make in
            make.center.equalTo(notificationView)
        }
    }
}
