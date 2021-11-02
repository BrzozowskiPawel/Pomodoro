//
//  PomodoroViewController.swift
//  Pomodoro
//
//  Created by Paweł Brzozowski on 02/11/2021.
//

import UIKit
import AVFoundation

class PomodoroViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progresBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var timerStop = Timer()
    var playerMusic: AVAudioPlayer!
    
    var pomodoroType: String = "NoData"
    var player: AVPlayer?
    
    var totalTime = 0
    var secondsPassed = 0
    
    var pomodoroTimes = [ "Learning": 20, "Working": 10, "Custom": 120]
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = pomodoroType + " 🍅"
        playBackgroundVideo()
        timeLabel.text = getTimeLeft()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
    
    @IBAction func startButton(_ sender: Any) {
        
        // Stops the timer from ever firing again and requests its removal from its run loop.
        timer.invalidate()
        
        
        totalTime = pomodoroTimes[pomodoroType]!
        
        progresBar.progress = 0.0
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progresBar.progress = percentageProgress
            
            timeLabel.text = getTimeLeft()
            
        }
        else {
            playSound(soundName: "sound_alarm")
            timer.invalidate()
            timerStop = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopMusic), userInfo: nil, repeats: false)
        }
    }
    
    @objc func stopMusic() {
        playerMusic.stop()
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        playerMusic = try! AVAudioPlayer(contentsOf: url!)
        playerMusic.play()
                
    }
    
    func getTimeLeft() -> String {
        let timeInterval = TimeInterval(pomodoroTimes[pomodoroType]! - secondsPassed)
        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        
        dateFormatter.dateFormat = "mm:ss"
        return dateFormatter.string(from: myNSDate)
    }
    
    @IBAction func settingPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "\(pomodoroType) 🍅", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Change time", style: .default) { action in
            
        }
        
        alert.addTextField { (alerTextField) in
            alerTextField.placeholder = "New duration [seconds]"
//            print(alerTextField.text!)

        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        timeLabel.text = getTimeLeft()
    }
    
    func toggleMainLabel() {
        if mainLabel.text == "Now is focus time" {
            mainLabel.text = "You can rest :)"
        }
        else {
            mainLabel.text = "Now is focus time"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
        timerStop.invalidate()
    }
}
