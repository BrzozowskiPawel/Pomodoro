//
//  PomodoroViewController.swift
//  Pomodoro
//
//  Created by Paweł Brzozowski on 02/11/2021.
//

import UIKit

class PomodoroViewController: UIViewController {
    
    var pomodoroType: String = "NoData"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = pomodoroType
        
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
