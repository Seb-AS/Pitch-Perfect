//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sebas on 9/25/15.
//  Copyright © 2015 Sebas. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
         setUIStatus(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stopAudio(sender: UIButton) {
        stopButton.hidden = true
        recordButton.selected = false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func setUIStatus(isRecording: Bool) {
        if (isRecording) {
            recordButton.enabled = false
            statusLabel.text = "Recording..."
            stopButton.hidden = false
        } else {
            recordButton.enabled = true
            statusLabel.text = "Tap To Record"
            stopButton.hidden = true
        }
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag)
        {
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
            
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayback)
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else
        {
            print("Recording Fail")
            setUIStatus(false)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       if(segue.identifier == "stopRecording")
       {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
    
    @IBAction func recordAudio(sender: UIButton) {
         setUIStatus(true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
}

