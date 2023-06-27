//
//  ViewController.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 23.06.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var options: [[Option]]?

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(GeneralTableViewCell.self, forCellReuseIdentifier: "general")
        tableView.register(SwitchedTableViewCell.self, forCellReuseIdentifier: "switched")
        tableView.register(NotificatedTableViewCell.self, forCellReuseIdentifier: "notificated")
        tableView.register(DescribedTableViewCell.self, forCellReuseIdentifier: "described")
        tableView.separatorInset = UIEdgeInsets(top: .zero, left: 60, bottom: .zero, right: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        options = Option.options
        setupView()
        setupHierarchy()
        setupLayout()        
    }

    // MARK: - Setup

    private func setupView() {
        title = "Настройки"
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

// MARK: - Delegate / DataSource

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = options?[indexPath.section][indexPath.row]

        switch option?.optionType {
        case .general:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "general", for: indexPath) as? GeneralTableViewCell else { return UITableViewCell() }
            cell.option = option
            return cell
        case .switched:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "switched", for: indexPath) as? SwitchedTableViewCell else { return UITableViewCell() }
            cell.option = option
            return cell
        case .notificated:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificated", for: indexPath) as? NotificatedTableViewCell else { return UITableViewCell() }
            cell.option = option
            return cell
        case .described:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "described", for: indexPath) as? DescribedTableViewCell else { return UITableViewCell() }
            cell.option = option
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(options?[indexPath.section][indexPath.row].name ?? "")")
        detailViewController.option = options?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
