//
//  ViewController.swift
//  hustle-mode
//
//  Created by Mohammed Mohsin Sayed on 10/22/18.
//  Copyright © 2018 Mohammed Mohsin Sayed. All rights reserved.
//

//Habibi
import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var darkBlueBackground: UIImageView!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var powerButton: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBackground.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 402)
            
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
    
}

