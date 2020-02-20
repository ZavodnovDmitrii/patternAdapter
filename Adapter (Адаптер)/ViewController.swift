 
 import UIKit
 
 class ViewController: UIViewController {
    let auth: AdapterProtocol = AdapterAuth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAuth(email: "jack@mail.ru", password: "12gh32")
    }
    
    func requestAuth(email: String?, password: String) {
        auth.login(email: email, password: password, succeses: { (user, token) in
            print(user.mail, token.token)
        }) { (error) in
            print("error")
        }
    }
 }
 
