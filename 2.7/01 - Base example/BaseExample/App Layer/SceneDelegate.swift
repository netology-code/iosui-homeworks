import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var tabBarControllerDelegate: TabBarControllerDelegate?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        window.rootViewController = createNavigationController()
//        window.rootViewController = createTabBarController()
        
        window.makeKeyAndVisible()
        self.window = window
    }
    
    // MARK: - Private
    
    private func createNavigationController() -> UINavigationController {
        let contentViewController = ViewController()
        contentViewController.view.backgroundColor = UIColor.random
        contentViewController.title = "Test"
        
        let navigationController = UINavigationController(
            rootViewController: contentViewController
        )
        
        return navigationController
    }
    
    private func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBlue
        
        setTabBarItemColors(appearance.stackedLayoutAppearance)
        setTabBarItemColors(appearance.inlineLayoutAppearance)
        setTabBarItemColors(appearance.compactInlineLayoutAppearance)
        
        setTabBarItemBadgeAppearance(appearance.stackedLayoutAppearance)
        setTabBarItemBadgeAppearance(appearance.inlineLayoutAppearance)
        setTabBarItemBadgeAppearance(appearance.compactInlineLayoutAppearance)
        
        tabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        tabBarController.tabBar.isTranslucent = false
        
        tabBarController.viewControllers = (0...4)
            .map {
                let contentViewController = ViewController()
                contentViewController.view.backgroundColor = UIColor.random
                contentViewController.title = "Screen \($0 + 1)"
                contentViewController.tabBarItem.image = UIImage(
                    systemName: "star"
                )
                contentViewController.tabBarItem.selectedImage = UIImage(
                    systemName: "star.fill"
                )
                
                return contentViewController
            }.map {
                UINavigationController(
                    rootViewController: $0
                )
            }
        
        let tabBarControllerDelegate = TabBarControllerDelegate()
        tabBarController.delegate = tabBarControllerDelegate
        
        self.tabBarControllerDelegate = tabBarControllerDelegate
        
        return tabBarController
    }
    
    private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.iconColor = .systemYellow
        itemAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemYellow
        ]
        
        itemAppearance.selected.iconColor = .systemOrange
        itemAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemOrange
        ]
    }
    
    private func setTabBarItemBadgeAppearance(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.badgeBackgroundColor = .systemGreen
        itemAppearance.normal.badgeTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGreen
        ]
        itemAppearance.normal.badgePositionAdjustment = UIOffset(
            horizontal: 10,
            vertical: -10
        )
    }
}
