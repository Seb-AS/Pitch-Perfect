//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sebas on 9/25/15.
//  Copyright © 2015 Sebas. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        audioPlayer.volume = 1.0
        
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playAudioWithVariableRate(rate: Float) {
        stopAndReset()
        
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAndReset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    func stopAndReset(){
        if(audioPlayer.playing){
            audioPlayer.stop()
        }
        if(audioEngine.running){
            audioEngine.stop()
            audioEngine.reset()
        }
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithVariableRate(2.0)
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithVariableRate(0.5)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        stopAndReset()
    }
}

