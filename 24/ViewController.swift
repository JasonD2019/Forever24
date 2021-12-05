//
//  ViewController.swift
//  24
//
//  Created by Xingjian Ding on 11/4/21.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

class ViewController: UIViewController {

    @IBOutlet var playButton: MDCButton!
    @IBOutlet var settingButton: MDCButton!
    @IBOutlet var aboutButton: MDCButton!
    var vc1: PlayViewController!
    var vc2: SettingViewController!
    var vc3: AboutViewController!
    var vc4: LoginViewController!
    @IBOutlet weak var washUImage1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc1 = storyboard?.instantiateViewController(identifier: "gameVC")
        vc2 = storyboard?.instantiateViewController(identifier: "settingVC")
        vc2.playVC = vc1
        vc2.mainVC = self
        vc3 = storyboard?.instantiateViewController(identifier: "aboutVC")
        vc2.aboutVC = vc3
        vc4 = storyboard?.instantiateViewController(identifier: "LoginVC")
        vc1.modalPresentationStyle = .fullScreen
        vc2.modalPresentationStyle = .fullScreen
        vc3.modalPresentationStyle = .fullScreen
        vc4.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
        setButtonstyle()
        MusicPlayer.shared.startBackgroundMusic()
    }

    func setButtonstyle(){
        let scheme = MDCContainerScheme()
        let theColor = UIColor(named: "Color3")!
        let theColor2 = UIColor(named: "Color2")!
        playButton.applyTextTheme(withScheme: scheme)
        settingButton.applyTextTheme(withScheme: scheme)
        aboutButton.applyTextTheme(withScheme: scheme)
        playButton.setTitleFont(UIFont(name: "Chalkboard SE", size: 20), for: .normal)
        settingButton.setTitleFont(UIFont(name: "Chalkboard SE", size: 20), for: .normal)
        aboutButton.setTitleFont(UIFont(name: "Chalkboard SE", size: 20), for: .normal)
        playButton.inkColor = theColor
        settingButton.inkColor = theColor
        aboutButton.inkColor = theColor
        playButton.setTitleColor(theColor2, for: .normal)
        settingButton.setTitleColor(theColor2, for: .normal)
        aboutButton.setTitleColor(theColor2, for: .normal)
        playButton.minimumSize = CGSize(width: 64, height: 48)
        settingButton.minimumSize = CGSize(width: 64, height: 48)
        aboutButton.minimumSize = CGSize(width: 64, height: 48)
    }
    
    @IBAction func goToGamePage(_ sender: Any) {
        present(vc1, animated: false)
    }
    
    @IBAction func goToSettingPage(_ sender: Any) {
        present(vc2, animated: false)
    }
    
    @IBAction func goToAboutPage(_ sender: Any) {
        present(vc3, animated: false)
    }
    @IBAction func clickLogin(_ sender: Any) {
        present(vc4, animated: false)
    }
}

