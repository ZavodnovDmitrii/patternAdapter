
import Foundation

struct User {
    var mail: String
    var password: String
}

struct Token {
    var token: String
}

//MARK: - AdapterProtocol
protocol AdapterProtocol {
    func login(email: String?, password: String, succeses: @escaping(User, Token) -> Void, failor: @escaping(Error) -> Void)
}

//MARK: - AdapterClass
class AdapterAuth: AdapterProtocol {
    private let googleAuth = GoogleAuth()
    
    func login(email: String?, password: String, succeses: @escaping (User, Token) -> Void, failor: @escaping (Error) -> Void) {
        googleAuth.login(mail: email, password: password) { (googleUser, error) in
            guard let googleUser = googleUser else {
                if let error = error {
                    failor(error)
                }
                return
            }
            
            let user = User(mail: googleUser.email, password: googleUser.password)
            let token = Token(token: googleUser.token)
            succeses(user, token)
            
        }
    }
}
