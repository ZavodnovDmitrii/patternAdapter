
import Foundation

public struct GoogleUser {
    var email: String
    var password: String
    var token: String
}

public class GoogleAuth {
    public func login(mail: String?, password: String?, comletionBlock: @escaping(GoogleUser?, Error?) -> Void) {
        
        if mail != nil && password != nil {
        let token = "google auth token"
        let user = GoogleUser(email: mail!, password: password!, token: token)
        comletionBlock(user, nil)
        } else {
            let error = NSError()
            error.self as! Error
            
        
            comletionBlock(nil, error)
        }
    }
}
