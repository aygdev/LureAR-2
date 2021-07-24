//
//  SignInViewController.swift
//  LureAR
//
//  Created by Andrei Colrev on 16/10/17.
//  Copyright © 2017 Andrei Colrev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet var textField_Email: UITextField!
    @IBOutlet var textField_Password: UITextField!
    
    @IBOutlet var btnOutlet_Facebook: UIButton!
    @IBOutlet var btnOutlet_Google: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnOutlet_Facebook.layer.borderColor = UIColor.init(colorLiteralRed: 0/255, green: 0/255, blue: 180/255, alpha: 1).cgColor
        btnOutlet_Google.layer.borderColor = UIColor.init(colorLiteralRed: 223/255, green: 14/255, blue: 0/255, alpha: 1).cgColor

        self.setBorderAndLayer(_button: btnOutlet_Facebook)
        self.setBorderAndLayer(_button: btnOutlet_Google)
        
//        GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBorderAndLayer(_button : UIButton) -> Void {
        _button.backgroundColor = .clear
        _button.layer.cornerRadius = 22
        _button.layer.borderWidth = 1
    }
    
    @IBAction func btnClicked_PasswordHidden(_ sender: Any) {
    }
    
    @IBAction func btnClicked_Login(_ sender: Any) {
    }
    
    @IBAction func btnClicked_Facebook(_ sender: Any) {
        let login = FBSDKLoginManager.init()
        login.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            if (error != nil) {
                print(error?.localizedDescription);
            } else {
                var fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if(fbloginresult.isCancelled) {
                    //Show Cancel alert
                } else if(fbloginresult.grantedPermissions.contains("email")) {
                    self.returnUserData()
                    //fbLoginManager.logOut()
                }
            
            }
        }
    }
    
    func returnUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                    let alertView = UIAlertController(title: "Alert!", message: String.init(format: "%@", result as! CVarArg), preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                        
                    })
                    alertView.addAction(action)
                    self.present(alertView, animated: true, completion: nil)
                    
                }
            })
        }
    }
    
    @IBAction func btnClicked_Google(_ sender: Any) {
    }
    
    @IBAction func btnClicked_SignUp(_ sender: Any) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
//    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
//    }
//
//    // Present a view that prompts the user to sign in with Google
//    func signIn(signIn: GIDSignIn!,
//                presentViewController viewController: UIViewController!) {
////        self.presentViewController(viewController, animated: true, completion: nil)
//    }
//
//    // Dismiss the "Sign in with Google" view
//    func signIn(signIn: GIDSignIn!,
//                dismissViewController viewController: UIViewController!) {
////        self.dismissViewControllerAnimated(true, completion: nil)
//    }

}
