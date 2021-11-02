//
//  ViewController.swift
//  Pomodoro
//
//  Created by Paweł Brzozowski on 29/10/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var pomodoroType: String = ""
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playBackgroundVideo()
        
    }

    func playBackgroundVideo() {
        let path = Bundle.main.path(forResource: "backgroundVideo", ofType: ".mp4")
        player =  AVPlayer(url: URL(fileURLWithPath: path!))
        player?.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true
    }
    
    @objc func playerItemDidReachEnd() {
        player?.seek(to: CMTime.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let definitionVC = segue.destination as! PomodoroViewController
        definitionVC.pomodoroType = self.pomodoroType
    }
    
    @IBAction func learningButtonPressed(_ sender: Any) {
        pomodoroType = "Learning"
        performSegue(withIdentifier: "goToPomodoro", sender: sender)
    }
    
    @IBAction func workingButtonPressed(_ sender: Any) {
        pomodoroType = "Working"
        performSegue(withIdentifier: "goToPomodoro", sender: sender)
    }
    @IBAction func customButtonPressed(_ sender: Any) {
        pomodoroType = "Custom"
        performSegue(withIdentifier: "goToPomodoro", sender: sender)
    }
    
}

