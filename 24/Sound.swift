//
//  Sound.swift
//  24
//
//  Created by Xingjian Ding on 11/29/21.
//

import Foundation
import AVFoundation

//  Monkeys Spinning Monkeys Kevin MacLeod (incompetech.com)
// Licensed under Creative Commons: By Attribution 3.0 License
// http://creativecommons.org/licenses/by/3.0/
// Music promoted by https://www.chosic.com/free-music/all/
class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "Monkeys-Spinning-Monkeys", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                audioPlayer.volume = 0.5
            } catch {
                print(error)
            }
        }
    }
    func changeVolume(newvolume: Float){
        audioPlayer!.volume = newvolume
    }
}
