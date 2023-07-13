//
//  MainController.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 23.06.2023.
//

import UIKit

final class MainController: UIViewController {

    private var model: [[Option]]?

    private var mainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureNavigation()
    }
}

// MARK: - Configurations

private extension MainController {
    func configureView() {
        view = MainView()
        model = Option.options
        mainView?.tableView.delegate = self
        mainView?.tableView.dataSource = self
    }

    func configureNavigation() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableViewDataSource

extension MainController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        model?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch model?[indexPath.section][indexPath.row].optionType {
        case .general:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "general", for: indexPath) as? GeneralTableViewCell else { return UITableViewCell() }
            cell.option = model?[indexPath.section][indexPath.row]
            return cell
        case .switched:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "switched", for: indexPath) as? SwitchedTableViewCell else { return UITableViewCell() }
            cell.option = model?[indexPath.section][indexPath.row]
            cell.state = { [self] isOn in
                model?[indexPath.section][indexPath.row].isOn = isOn
            }
            return cell
        case .described:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "described", for: indexPath) as? DescribedTableViewCell else { return UITableViewCell() }
            cell.option = model?[indexPath.section][indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension MainController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if model?[indexPath.section][indexPath.row].name == "Конфиденциальность и безопасность" {
            return 54
        }
        return 44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = DetailController()
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(model?[indexPath.section][indexPath.row].name ?? "")")
        detailController.option = model?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }
}
