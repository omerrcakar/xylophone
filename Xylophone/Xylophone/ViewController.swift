//
//  ViewController.swift
//  Xylophone
//
//  Created by ÖMER  on 4.01.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    @IBOutlet var allButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in allButtons{
            button.layer.cornerRadius = 25
            button.clipsToBounds = true // Taşan içeriğin görünmemesi için
            button.setTitleColor(.white, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            
        }
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text{
            //print(title)
            playSound(title: title)
            sender.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                sender.alpha = 1.0
            }
        }else {
            playSound(title: "C")
        }
    }
    
    func playSound(title: String){
        guard let path = Bundle.main.path(forResource: title, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}

