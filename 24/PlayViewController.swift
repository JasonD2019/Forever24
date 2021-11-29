//
//  PlayViewController.swift
//  24
//
//  Created by Xingjian Ding on 11/5/21.
// Original cards images are from Playing Cards iOS Assets https://github.com/hayeah/playing-cards-assets.

import UIKit
import JFPopup
import MathParser

class PlayViewController: UIViewController {

    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var times: UIButton!
    @IBOutlet var over: UIButton!
    @IBOutlet var l_parenthesis: UIButton!
    @IBOutlet var r_parenthesis: UIButton!
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var textField: UILabel!
    @IBOutlet var timeProgessView: UIProgressView!
    @IBOutlet var timeLabel: UILabel!
    
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
                    ["12","12", "2", "2"],
                    ["1","1", "2", "2"],
                    ["2","2", "2", "3"]]
    var answer = [[" 4 x 6 % 2 x 2", " 4 x 6 x 2 % 2"],
                  [" 3 x 8 x 1 x 1", " 3 x 8 % 1 x 1", " 3 x 8 x 1 % 1"],
                  [" 12 + 12 + 2 - 2"],
                  [],
                  [" 2 x 2 x 2 x 3", " 3 x 2 x 2 x 2", " 2 x 3 x 2 x 2", " 2 x 2 x 3 x 2"]
                 ]
    var time = 10
    var limitTime = 0
    var timeCount = 0
    var timeProgressIsRunning = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentCards()
        clickCheck()

    }
    
    func presentCards(){
//        do{
//            let value = try "1 + 2".evaluate()
//            print(value)
//        }
//        catch{
//            print("wrong")
//        }
        if level < 5{
            card_1_Name = resource[level][0]
            card_2_Name = resource[level][1]
            card_3_Name = resource[level][2]
            card_4_Name = resource[level][3]
        }
        else{
            card_1_Name = String(Int.random(in: 1...13))
            card_2_Name = String(Int.random(in: 1...13))
            card_3_Name = String(Int.random(in: 1...13))
            card_4_Name = String(Int.random(in: 1...13))
        }
        
        let card_1_image = UIImage(named: "\(card_1_Name)_clubs")
        card1.image = card_1_image
        let card_2_image = UIImage(named: "\(card_2_Name)_diamonds")
        card2.image = card_2_image
        let card_3_image = UIImage(named: "\(card_3_Name)_spades")
        card3.image = card_3_image
        let card_4_image = UIImage(named: "\(card_4_Name)_hearts")
        card4.image = card_4_image
        startCountDown()
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
        var equation = text.replacingOccurrences(of: "x", with: "*")
        equation = equation.replacingOccurrences(of: "%", with: "/")
        do{
            print(equation)
            let value = try equation.evaluate()
            print(value)
            if value == 24{
                win()
            }
            else{
                lose()
            }
        }
        catch{
            lose()
        }
    }
    @IBAction func clickImpossible(_ sender: Any) {
        let c1 = Int(card_1_Name) ?? 0
        let c2 = Int(card_2_Name) ?? 0
        let c3 = Int(card_3_Name) ?? 0
        let c4 = Int(card_4_Name) ?? 0
        let solution = Solution.init()
        let result = solution.judgePoint24([c1, c2, c3, c4])
        print(c1,c2,c3,c4)
        print(result)
        if result == false{
            win()
        }
        else{
            lose()
        }
    }
    
    func win(){
        timeProgressIsRunning = false
        JFPopupView.popup.alert {[
           .subTitle("YOU WIN!!! Press OK to next level"),
           .showCancel(false),
           .confirmAction([
               .text("OK"),
               .tapActionCallback({
                self.level += 1
                JFPopupView.popup.toast(hit: "Level \(self.level + 1)")
                self.timeProgressIsRunning = true
                self.levelLabel.text = "Level \(self.level+1)"
                self.textField.text = ""
                self.presentCards()
               })
           ])
       ]}
    }
    
    func lose(){
        timeProgressIsRunning = false
        self.popup.alert {
           [.title("WRONG."),
            .subTitle("Press OK to play again"),
            .cancelAction([.text("Cancle"),.tapActionCallback({
                            JFPopupView.popup.toast(hit: "Cancled")
                        })]),
            .confirmAction([
               .text("OK"),
               .tapActionCallback({
                    JFPopupView.popup.toast(hit: "Level \(self.level+1)")
                    self.timeProgressIsRunning = true
                    self.textField.text = ""
                    self.presentCards()
               })
            ])
           ]
       }
    }
    
    func checkLeagal(euqation: String) -> Bool{

        return true
    }
    
    // timer: https://www.jb51.net/article/181706.htm
    func startCountDown() {
        performSelector(inBackground: #selector(countDownThread), with: nil)
    }
    
    @objc func countDownThread() {
        limitTime = time
        timeCount = time
        for _ in 0..<timeCount + 1 {
            if timeProgressIsRunning == true{
                limitTime = limitTime - 1;
                self.performSelector(onMainThread: #selector(updateJumpBtn), with: self, waitUntilDone: true)
                sleep(1);
            }
            else{
                return
            }
        }
    }
    
    @objc func updateJumpBtn() {
        if (limitTime < 0) {
            lose()
        }
        else {
            let str = String(format: "%.2f", Float(limitTime)/Float(timeCount))
            let time = Float(str) ?? 0.0
            timeLabel.text = String(limitTime)
            timeProgessView.setProgress(time, animated: true)
        }
    }
    
    func setNewTime(newtime: Int){
        time = newtime
    }
    
    @IBAction func backButton(_ sender: Any) {
        print("back")
        self.dismiss(animated: true, completion: nil)
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
