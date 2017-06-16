import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    static func create(_ style: UIModalTransitionStyle) -> TabViewController {
        let controller = R.storyboard.main.tabViewController()
        controller?.modalTransitionStyle = style
        return controller!
    }
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Tabを押したら中のViewControllerを指定する処理を調査中
    }
}
