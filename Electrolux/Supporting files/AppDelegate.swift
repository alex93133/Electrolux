import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?

    // MARK: - App Lifecycle
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupStartScreen()
        return true
    }

    // MARK: - Functions
    private func setupStartScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: UIViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
