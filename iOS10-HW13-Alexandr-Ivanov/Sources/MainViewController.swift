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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        options?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell

        switch options?[indexPath.section][indexPath.row].optionType {
        case .general:
            let cell = tableView.dequeueReusableCell(withIdentifier: "general", for: indexPath) as? GeneralTableViewCell
            cell?.option = options?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()

        case .switched:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switched", for: indexPath) as? SwitchedTableViewCell
            cell?.option = options?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
        case .notificated:
            let cell = tableView.dequeueReusableCell(withIdentifier: "notificated", for: indexPath) as? NotificatedTableViewCell
            cell?.option = options?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()

        case .described:
            let cell = tableView.dequeueReusableCell(withIdentifier: "described", for: indexPath) as? DescribedTableViewCell
            cell?.option = options?[indexPath.section][indexPath.row]
            return cell ?? UITableViewCell()
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
