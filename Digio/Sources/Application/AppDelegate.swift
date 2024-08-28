//
//  AppDelegate.swift
//  Zip4MeApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import SafariServices
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var orientationMask = UIInterfaceOrientationMask.portrait

    private lazy var appCoordinator: Coordinator? = makeAppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupApplication()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {}

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationMask
    }
}

// MARK: - Helpers

extension UIApplication {
    class func changeRootViewController(_ rootViewController: BaseNavigationViewController) {
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appdelegate.window else {
                  return
        }

        window.rootViewController = rootViewController

        UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

private extension AppDelegate {
    var isRunningUnitTests: Bool {
        // this means that we are running unit tests
        return ProcessInfo.processInfo.environment[Constants.Testing.testing] != nil
    }

    var isRunningUITests: Bool {
        return ProcessInfo.processInfo.environment[Constants.Testing.uitesting] != nil
    }

    func makeAppCoordinator() -> Coordinator? {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)

        self.window = window

        return appCoordinator
    }

    func setupApplication() {
        UIView.setAnimationsEnabled(!isRunningUITests)

        if isRunningUnitTests && !isRunningUITests {
            window = UIWindow()
            window?.rootViewController = UIViewController()
            window?.makeKeyAndVisible()
        } else {
            appCoordinator?.start()
        }
    }
}
