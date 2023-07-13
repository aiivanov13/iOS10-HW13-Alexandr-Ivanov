//
//  DetailViewController.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 25.06.2023.
//

import UIKit

final class DetailController: UIViewController {

    var option: Option?

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }
    

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureNavigation()
    }
}

// MARK: - Configurations

private extension DetailController {
    func configureView() {
        view = DetailView()
        detailView?.backgroundColor = option?.iconBackgroundColor
        detailView?.titleLabel.text = option?.name
        detailView?.imageView.image = option?.image
        detailView?.button.backgroundColor = option?.iconBackgroundColor
        detailView?.button.addTarget(.none, action: #selector(buttonTapped), for: .touchUpInside)
    }

    func configureNavigation() {
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - Action

private extension DetailController {
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut) { [self] in
            switch detailView?.button.titleLabel?.text {
            case "Next":
                detailView?.titleLabel.alpha = 1
                detailView?.button.setTitle("Settings", for: .normal)
            case "Settings":
                navigationController?.popViewController(animated: true)
            default:
                detailView?.imageView.alpha = 1
                detailView?.button.setTitle("Next", for: .normal)
            }
        }
    }
}
