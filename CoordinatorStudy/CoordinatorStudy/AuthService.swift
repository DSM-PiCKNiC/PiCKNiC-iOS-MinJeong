import Foundation

class AuthService {
    
    private static let isLoggedInKey = "isLoggedIn"
    
    static let shared = AuthService()
    
    var isLoggedIn: Bool {
        UserDefaults.standard.bool(forKey: AuthService.isLoggedInKey)
    }
    
    func login() {
        UserDefaults.standard.set(true, forKey: AuthService.isLoggedInKey)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: AuthService.isLoggedInKey)
    }
    
}

