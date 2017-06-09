import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:
            UIFont(name: "Avenir-Medium", size: 14)!], for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0, -9)

        // 最初のアクセスを判定
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(false, forKey: "logined")
//        userDefaults.synchronize()

        if UserDefaults.standard.bool(forKey: "logined") == false {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "AccountNav")
            self.window?.rootViewController = controller
            self.window?.makeKeyAndVisible()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
