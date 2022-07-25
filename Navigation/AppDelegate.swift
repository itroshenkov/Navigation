import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
//        // Задание IOSDT 1.1:
//        let url = AppConfiguration.randomURL()
//                NetworkServis.shared.urlSession(stringURL: url)
        
//         
//        // MARK: - HW IOSDT 1.2 task 1
//                InfoNetworService.shared.urlSession()
        
        
        let inspector = MyLoginFactory.shared.loginFactory()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray5
        
        //Feed Контроллер
        
        let feedVc = FeedViewController()
        feedVc.title = "Feed"
        
        let feedNavigationController = UINavigationController(rootViewController: feedVc)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 0)
        
        feedNavigationController.navigationBar.standardAppearance = appearance
        feedNavigationController.navigationBar.scrollEdgeAppearance = feedNavigationController.navigationBar.standardAppearance
        
        //Profile Контроллер
        
        let profileVc = ProfileViewController(userService: TestUserService() as UserService, name: "testname")
        profileVc.title = "Profile"
        
        // Login Контроллер
        
        let logInVc = LogInViewController()
        let logInNavigationController = UINavigationController(rootViewController: logInVc)
        logInNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 0)
        logInVc.delegate = inspector
        
        logInNavigationController.navigationBar.standardAppearance = appearance
        logInNavigationController.navigationBar.scrollEdgeAppearance = logInNavigationController.navigationBar.standardAppearance
        
        // Tabbar Контроллер
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavigationController,logInNavigationController]
        tabBarController.tabBar.isHidden = false
        
        tabBarController.tabBar.backgroundColor = UIColor.systemGray
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

