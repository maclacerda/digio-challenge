//
//  BaseViewController.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import SafariServices
import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties

    override var prefersStatusBarHidden: Bool {
        return statusBarHidden
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            guard let navigationController = self.navigationController as? BaseNavigationViewController else { return }
            navigationController.statusBarStyle = statusBarStyle
        }
    }

    var statusBarHidden = false {
        didSet {
            guard let navigationController = self.navigationController as? BaseNavigationViewController else { return }
            navigationController.statusBarHidden = statusBarHidden
        }
    }

    var showNavigationBar = false {
        didSet {
            guard let navigationController = self.navigationController as? BaseNavigationViewController else { return }
            navigationController.showNavigationBar = showNavigationBar
        }
    }

    // MARK: - Initializer

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        showNavigationBar = true
        statusBarHidden = false
        statusBarStyle = .default
    }

    // MARK: - Public methods
    func asBaseNavigationController() -> BaseNavigationViewController? {
        return navigationController as? BaseNavigationViewController
    }

    func buildAvatarView(with welcomeMessage: String) {
        let imageView = UIImageView()

        imageView.image = .avatarIcon

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20)
        ])

        let titleLabel = UILabel()
        titleLabel.text = welcomeMessage

        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.spacing = 5
        stackView.alignment = .center

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
    }

    func showMessage(with title: String = CommonsLocalizable.ops.localized, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(
            title: CommonsLocalizable.ok.localized,
            style: .default
        )

        alertController.addAction(okAction)

        navigationController?.present(alertController, animated: true)
    }
}
