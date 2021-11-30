//
//  SettingViewController.swift
//  24
//
//  Created by XingjianDing on 11/5/21.
//

import UIKit
import AVFoundation

class SettingViewController: UIViewController {

    @IBOutlet var timerField: UITextField!
    var playVC: PlayViewController?
    var mainVC: ViewController?
    var aboutVC: AboutViewController?
    @IBOutlet var backgroundSegmented: UISegmentedControl!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterTime(_ sender: Any) {
        let newtime: Int? = Int(timerField.text!)
        playVC!.setNewTime(newtime: newtime!)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backgroundColorChange(_ sender: Any) {
        switch backgroundSegmented.selectedSegmentIndex{
        case 0:
            self.overrideUserInterfaceStyle = .light
            mainVC?.overrideUserInterfaceStyle = .light
            playVC?.overrideUserInterfaceStyle = .light
            aboutVC?.overrideUserInterfaceStyle = .light
        case 1:
            self.overrideUserInterfaceStyle = .dark
            mainVC?.overrideUserInterfaceStyle = .dark
            playVC?.overrideUserInterfaceStyle = .dark
            aboutVC?.overrideUserInterfaceStyle = .dark
        default:
            break
        }
    }
    
    @IBAction func SliderChanged(_ sender: Any) {
        let currentVolume = Float(volumeSlider.value)
        MusicPlayer.shared.changeVolume(newvolume: currentVolume)
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
