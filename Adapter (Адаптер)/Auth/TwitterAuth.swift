import Foundation

public struct TwitterUser {
    var email: String
    var password: String
    var token: String
}

public class TwitterAuth {
    public func login(mail: String?, password: String?, comletionBlock: @escaping(TwitterUser?, Error?) -> Void) {
        
        if mail != nil && password != nil {
        let token = "google auth token"
        let user = TwitterUser(email: mail!, password: password!, token: token)
        comletionBlock(user, nil)
        } else {
            let error = NSError().localizedDescription
            print(error, "no email, no password")
            comletionBlock(nil, error as? Error)
        }
    }
}
