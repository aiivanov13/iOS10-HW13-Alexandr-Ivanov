//
//  DescribedTableViewCell.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 12.07.2023.
//

import UIKit

class DescribedTableViewCell: GeneralTableViewCell {
    override class var identifier: String { "described" }
    
    override var option: Option? {
        didSet {
            switch option?.optionType {
            case .described(let state):
                describingLabel.text = state?.rawValue
            default:
                break
            }
        }
    }
    
    // MARK: - Outlets
    
    private let describingLabel: UILabel = {
        let label = UILabel()
        label.text = "on"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .systemGray
        label.contentMode = .right
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
        addSubview(describingLabel)
    }
    
    private func setupLayout() {
        describingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(contentView).inset(10)
        }
    }
}
