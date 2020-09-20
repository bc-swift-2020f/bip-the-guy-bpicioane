//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Brenden Picioane on 9/20/20.
//  Copyright © 2020 Brenden Picioane. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var punchButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: "\(name)") {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription) could not initialize AVAudioPlayer object")
            }
            
        } else {
            print("ERROR: could not real data from file \(name)")
        }
    }
    
    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let imageFrame = imageView.frame
        let imageWidthShrink : CGFloat = 20
        let imageHeightShrink : CGFloat = 20
        let smallerImage = CGRect(x: imageView.frame.origin.x + imageWidthShrink,
                                 y: imageView.frame.origin.y + imageHeightShrink,
                                 width: imageView.frame.width - (2 * imageWidthShrink),
                                 height: imageView.frame.height - (2 * imageHeightShrink))
        imageView.frame = smallerImage
        
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations : {self.imageView.frame = imageFrame})
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageFrame = imageView.frame
        let imageWidthShrink : CGFloat = 20
        let imageHeightShrink : CGFloat = 20
        let smallerImage = CGRect(x: imageView.frame.origin.x + imageWidthShrink,
                                 y: imageView.frame.origin.y + imageHeightShrink,
                                 width: imageView.frame.width - (2 * imageWidthShrink),
                                 height: imageView.frame.height - (2 * imageHeightShrink))
        imageView.frame = smallerImage
        
        playSound(name: "punchSound")
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations : {self.imageView.frame = imageFrame})
    }
    
}

