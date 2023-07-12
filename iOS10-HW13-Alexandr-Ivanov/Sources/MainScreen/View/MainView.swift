//
//  MainView.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 10.07.2023.
//

import UIKit
import SnapKit

final class MainView: UIView {
    
    // MARK: - Outlets
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(GeneralTableViewCell.self, forCellReuseIdentifier: GeneralTableViewCell.identifier)
        tableView.register(SwitchedTableViewCell.self, forCellReuseIdentifier: SwitchedTableViewCell.identifier)
        tableView.register(DescribedTableViewCell.self, forCellReuseIdentifier: DescribedTableViewCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: 60, bottom: .zero, right: .zero)
        return tableView
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
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { $0.top.right.bottom.left.equalTo(self) }
    }
}
