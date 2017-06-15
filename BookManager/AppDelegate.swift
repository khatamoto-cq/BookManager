import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName:
            UIFont(name: "Avenir-Medium", size: 14)!], for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0, -9)

        // <開発用途に使用> アプリ初回起動時に設定したい場合はコメントアウト
        /*
        UserDefaults.standard.set(false, forKey: "logined")
        UserDefaults.standard.synchronize()
        */

        // 最初のアクセスを判定
        if !UserDefaults.standard.bool(forKey: "logined") {
            self.window?.rootViewController = R.storyboard.main.accountNav()
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
