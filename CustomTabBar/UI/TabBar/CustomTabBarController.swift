import UIKit

private let tabBarKey: String = "tabBar"

final class CustomTabBarController: UITabBarController {
    
    private lazy var myTabBar: UITabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(myTabBar, forKey: tabBarKey)
        setupTabItems()
    }
    
}

private extension CustomTabBarController {
    func setupTabItems() {
        let firstTabViewController = ViewController(title: "home", systemImageName: "house")
        let secondTabViewController = ViewController(title: "settings", systemImageName: "gearshape")
        setViewControllers([firstTabViewController, secondTabViewController], animated: true)
        selectedIndex = 1
    }
}
