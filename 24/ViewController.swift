//
//  ViewController.swift
//  24
//
//  Created by Xingjian Ding on 11/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var playButton: UIButton!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var aboutButton: UIButton!
    var vc1: PlayViewController!
    var vc2: SettingViewController!
    var vc3: AboutViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc1 = storyboard?.instantiateViewController(identifier: "gameVC")
        vc2 = storyboard?.instantiateViewController(identifier: "settingVC")
        vc2.playVC = vc1
        vc2.mainVC = self
        vc3 = storyboard?.instantiateViewController(identifier: "aboutVC")
        vc2.aboutVC = vc3
        vc1.modalPresentationStyle = .fullScreen
        vc2.modalPresentationStyle = .fullScreen
        vc3.modalPresentationStyle = .fullScreen
        // Do any additional setup after loading the view.
        setButtonstyle()
        MusicPlayer.shared.startBackgroundMusic()
    }

    func setButtonstyle(){
        playButton.backgroundColor = .clear
        playButton.layer.cornerRadius = 5
        playButton.layer.borderWidth = 1
        playButton.layer.borderColor = UIColor.black.cgColor
        settingButton.backgroundColor = .clear
        settingButton.layer.cornerRadius = 5
        settingButton.layer.borderWidth = 1
        settingButton.layer.borderColor = UIColor.black.cgColor
        aboutButton.backgroundColor = .clear
        aboutButton.layer.cornerRadius = 5
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.borderColor = UIColor.black.cgColor
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
}

