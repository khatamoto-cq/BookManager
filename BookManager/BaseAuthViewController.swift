import UIKit

class BaseAuthViewController: UIViewController {
    func saveAuthInfo(_ auth: Auth) {
        UserDefaults.standard.set(auth.requestToken, forKey: "request_token")
        UserDefaults.standard.set(auth.userId, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }

    func moveListViewController() {
        let controller = R.storyboard.main.tabViewController()
        controller?.modalTransitionStyle = .crossDissolve
        present(controller!, animated: true, completion: nil)
    }
}
