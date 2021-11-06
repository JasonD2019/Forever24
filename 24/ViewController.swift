//
//  ViewController.swift
//  24
//
//  Created by 丁行健 on 11/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var playButton: UIButton!
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtonstyle()
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
        let vc = storyboard?.instantiateViewController(identifier: "gameVC") as! PlayViewController
        present(vc, animated: true)
    }
    
    @IBAction func goToSettingPage(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "settingVC") as! SettingViewController
        present(vc, animated: true)
    }
    
    @IBAction func goToAboutPage(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "aboutVC") as! AboutViewController
        present(vc, animated: true)
    }
}

