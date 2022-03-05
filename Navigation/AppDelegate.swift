import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let feedVc = FeedViewController()
                feedVc.title = "Feed"
        let feedNavigationController = UINavigationController(rootViewController: feedVc)
                feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 0)
                
        let profileVc = ProfileViewController()
                profileVc.title = "Profile"
        let profileNavigationController = UINavigationController(rootViewController: profileVc)
                profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 0)
        
        
        
        let tabBarController = UITabBarController()
                tabBarController.viewControllers = [feedNavigationController,profileNavigationController]
                tabBarController.tabBar.isHidden = false
                window?.rootViewController = tabBarController
                window?.makeKeyAndVisible()
        
        return true
    }
}

