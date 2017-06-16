import UIKit

final class AuthManager {
    static let shared = AuthManager()

    private init() {}

    func save(_ auth: Auth) {
        UserDefaults.standard.set(auth.requestToken, forKey: "request_token")
        UserDefaults.standard.set(auth.userId, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }

    func getAuth() -> Auth {
        return Auth(userId: UserDefaults.standard.integer(forKey: "user_id"),
                    requestToken: UserDefaults.standard.string(forKey: "request_token")!)
    }

    func isEntry() -> Bool {
        return UserDefaults.standard.bool(forKey: "entried")
    }

    func saveEntry() {
        UserDefaults.standard.set(true, forKey: "entried")
        UserDefaults.standard.synchronize()
    }

    func isLogin() -> Bool {
        let auth = getAuth()
        return !auth.requestToken.isEmpty && auth.userId > 0
    }
}
