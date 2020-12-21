import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Dependencies
    var presentationAssembly: PresentationAssemblyProtocol

    init(presentationAssembly: PresentationAssemblyProtocol) {
        self.presentationAssembly = presentationAssembly
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabs()
    }


    // MARK: - Functions
    private func createTabs() {
        let tab1 = UINavigationController(rootViewController: presentationAssembly.imageSearcherViewController())
        let barItem1 = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        tab1.tabBarItem = barItem1


        let tab2 = UINavigationController(rootViewController: presentationAssembly.userInfoViewController())
        let barItem2 = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        tab2.tabBarItem = barItem2

        viewControllers = [tab1, tab2]
    }
}
