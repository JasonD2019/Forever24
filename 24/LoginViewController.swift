//
//  LoginViewController.swift
//  24
//
//  Created by 丁行健 on 12/4/21.
// 24 png from https://mariokart.fandom.com/wiki/User_blog:MarioKartDSYes_MarioKartWiiNo/My_Custom_Position_Icons_(Double_Dash,_DS,_and_Wii_Styles)

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    var vc5: LoginViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setView(){
        vc5 = storyboard?.instantiateViewController(identifier: "SignupVC")
        vc5.modalPresentationStyle = .fullScreen
        let theColor = UIColor(named: "Color1")!
        view1.layer.borderWidth = 1
        view1.layer.borderColor = theColor.cgColor
        continueButton.frame.size.height = 30
        continueButton.layer.cornerRadius = continueButton.frame.size.height/2
        usernameText.frame.size.height = 40
        passwordText.frame.size.height = 40
    }
    @IBAction func continueButton(_ sender: Any) {
        if usernameText.hasText == true && passwordText.hasText == true{
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func SignupButton(_ sender: Any) {
        if usernameText.hasText == true && passwordText.hasText == true{
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func gotoSignupbutton(_ sender: Any) {
        present(vc5, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
