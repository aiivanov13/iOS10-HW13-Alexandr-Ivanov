//
//  WithSwitchTableViewCell.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 24.06.2023.
//

import UIKit
import SnapKit

class SwitchedTableViewCell: GeneralTableViewCell {

    // MARK: - Outlets

    private let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(.none, action: #selector(switcherValueChanged), for: .valueChanged)
        return switcher
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        accessoryView = switcher
    }

    // MARK: - Actions

    @objc private func switcherValueChanged() {
        print("Switch был переключен на значение \(switcher.isOn) в ячейке \(option?.name ?? "")")
    }
}
