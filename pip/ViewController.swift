//
//  ViewController.swift
//  pip
//
//  Created by Vipin on 06/10/21.
//http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var playerView: UIView! // custom player
    
    var pip : AVPictureInPictureController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setupCustomPlayer()
    }
    
    //MARK:default player PIP avplayer controller
    private func startPlayVideo(){
        if let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
            let player = AVPlayer(url: url)
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true) {
              player.play()
            }
        }else{
            print("Invalid Url..")
        }
    }

    @IBAction func startVideo(_ sender: Any) {
        startPlayVideo()
        //pip.startPictureInPicture()
    }
    
    
    private func setupCustomPlayer(){
        if let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
            
            let player = AVPlayer(url: url)
                
            let playerLayer = AVPlayerLayer(player: player)
                
            playerLayer.frame = self.playerView.bounds
            playerLayer.videoGravity = .resizeAspectFill
            playerView.layer.addSublayer(playerLayer)
            
            pip = AVPictureInPictureController(playerLayer: playerLayer)
            
            player.play()
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

