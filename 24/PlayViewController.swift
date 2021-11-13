//
//  PlayViewController.swift
//  24
//
//  Created by Xingjian Ding on 11/5/21.
// Original cards images are from Playing Cards iOS Assets https://github.com/hayeah/playing-cards-assets.

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var times: UIButton!
    @IBOutlet var over: UIButton!
    @IBOutlet var l_parenthesis: UIButton!
    @IBOutlet var r_parenthesis: UIButton!
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var textField: UILabel!
    
    @IBOutlet var card1: UIImageView!
    @IBOutlet var card1View: UIView!
    @IBOutlet var card2: UIImageView!
    @IBOutlet var card2View: UIView!
    @IBOutlet var card3: UIImageView!
    @IBOutlet var card3View: UIView!
    @IBOutlet var card4: UIImageView!
    @IBOutlet var card4View: UIView!
    var card_1_Name: String = ""
    var card_2_Name: String = ""
    var card_3_Name: String = ""
    var card_4_Name: String = ""
    var level = 0
    var resource = [["4","6", "2", "2"],
                    ["3", "8", "1", "1"],
                    ["12","12", "2", "2"]]
    var answer = [[" 4 x 6 % 2 x 2", " 4 x 6 x 2 % 2"],
                  [" 3 x 8 x 1 x 1", " 3 x 8 % 1 x 1", " 3 x 8 x 1 % 1"],
                  [" 12 + 12 + 2 - 2"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentCards()
        clickCheck()
        // Do any additional setup after loading the view.
    }
    
    func presentCards(){
//        card_1_Name = String(Int.random(in: 1...13))
//        card_2_Name = String(Int.random(in: 1...13))
//        card_3_Name = String(Int.random(in: 1...13))
//        card_4_Name = String(Int.random(in: 1...13))
        card_1_Name = resource[level][0]
        card_2_Name = resource[level][1]
        card_3_Name = resource[level][2]
        card_4_Name = resource[level][3]
        
        let card_1_image = UIImage(named: "\(card_1_Name)_clubs")
        card1.image = card_1_image
        let card_2_image = UIImage(named: "\(card_2_Name)_diamonds")
        card2.image = card_2_image
        let card_3_image = UIImage(named: "\(card_3_Name)_spades")
        card3.image = card_3_image
        let card_4_image = UIImage(named: "\(card_4_Name)_hearts")
        card4.image = card_4_image
    }
    
    func clickCheck(){
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard1(sender:)))
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard2(sender:)))
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard3(sender:)))
        let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard4(sender:)))
        card1View.addGestureRecognizer(gesture1)
        card2View.addGestureRecognizer(gesture2)
        card3View.addGestureRecognizer(gesture3)
        card4View.addGestureRecognizer(gesture4)
    }
    
    @objc func clickCard1(sender : UITapGestureRecognizer) {
        textField.text = "\(textField.text!) \(card_1_Name)"
    }

    @objc func clickCard2(sender : UITapGestureRecognizer) {
        textField.text = "\(textField.text!) \(card_2_Name)"
    }
    
    @objc func clickCard3(sender : UITapGestureRecognizer) {
        textField.text = "\(textField.text!) \(card_3_Name)"
    }
    
    @objc func clickCard4(sender : UITapGestureRecognizer) {
        textField.text = "\(textField.text!) \(card_4_Name)"
        //checkLeagal(euqation: textField.text!)
    }
    
    @IBAction func clickPlus(_ sender: Any) {
        textField.text = "\(textField.text!) +"
    }
    @IBAction func clickMinus(_ sender: Any) {
        textField.text = "\(textField.text!) -"
    }
    @IBAction func clickTimes(_ sender: Any) {
        textField.text = "\(textField.text!) x"
    }
    @IBAction func clickOver(_ sender: Any) {
        textField.text = "\(textField.text!) %"
    }
    @IBAction func clickLP(_ sender: Any) {
        textField.text = "\(textField.text!) ("
    }
    @IBAction func clickRP(_ sender: Any) {
        textField.text = "\(textField.text!) )"
    }
    @IBAction func clickClear(_ sender: Any) {
        textField.text = ""
    }
    @IBAction func clickSubmit(_ sender: Any) {
        let text = textField.text!
        let theAnswer = answer[level]
        if theAnswer.contains(text){
            print("Win")
            win()
        }
        else{
            print(text)
            print("Wrong")
        }
    }
    @IBAction func clickImpossible(_ sender: Any) {
        let theAnswer = answer[level]
        if theAnswer == []{
            print("Win")
            win()
        }
        else{
            print("Wrong")
        }
    }
    
    func win(){
        level += 1
        levelLabel.text = "Level \(level+1)"
        textField.text = ""
        presentCards()
    }
    
    func checkLeagal(euqation: String) -> Bool{

        return true
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
