//
//  DetailViewController.swift
//  iOS10-HW13-Alexandr-Ivanov
//
//  Created by Александр Иванов on 25.06.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    var option: Option?

    // MARK: - Outlets

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.0
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var button: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(.none, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitle("Show", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.alpha = 0.0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = option?.iconBackgroundColor
        navigationController?.navigationBar.tintColor = .white
        titleLabel.text = option?.name
        imageView.image = option?.image
        button.backgroundColor = option?.iconBackgroundColor
    }

    private func setupHierarchy() {
        view.addSubview(infoView)
        infoView.addSubview(button)
        infoView.addSubview(titleLabel)
        view.addSubview(imageView)
    }

    private func setupLayout() {
        infoView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view.snp_centerYWithinMargins)
        }

        button.snp.makeConstraints { make in
            make.left.right.equalTo(infoView).inset(20)
            make.bottom.equalTo(infoView.snp_bottomMargin).inset(20)
            make.height.equalTo(50)
        }

        titleLabel.snp.makeConstraints { make in
            make.left.right.top.equalTo(infoView).inset(20)
        }

        imageView.snp.makeConstraints { make in
            make.left.right.equalTo(view).inset(100)
            make.height.equalTo(imageView.snp.width)
            make.centerY.equalTo(view.snp_centerYWithinMargins).dividedBy(2)
        }
    }

    // MARK: - Action

    @objc private func buttonTapped() {
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseInOut) {
            switch self.button.titleLabel?.text {
            case "Next":
                self.titleLabel.alpha = 1
                self.button.setTitle("Settings", for: .normal)
            case "Settings":
                self.navigationController?.popViewController(animated: true)
            default:
                self.imageView.alpha = 1
                self.button.setTitle("Next", for: .normal)
            }
        }
    }
}
