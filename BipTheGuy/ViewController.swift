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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func photoOrCameraPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            print("You clicked photo library!")
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            print("You clicked camera!")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
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

