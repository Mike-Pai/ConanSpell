//
//  SoundFunction.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/6.
//

import Foundation
import SwiftUI
import AVFoundation

extension AVPlayer{
    static var bgQueuePlayer = AVQueuePlayer()
    
    static var bgPlayerLooper: AVPlayerLooper!
    
    static func setupBgMusic() {
        guard let url = Bundle.main.url(forResource: "背景音樂", withExtension:"mp3")
        else {
            fatalError("Failed to find sound file.")
            
        }
        let item = AVPlayerItem(url: url)
        bgPlayerLooper = AVPlayerLooper(player: bgQueuePlayer, templateItem: item)
    }
    
    static let VoiceCorrectPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "答對音效", withExtension: "mp3")
        else{
            
            fatalError("Failed to find sound file.")
            
        }
        return AVPlayer(url: url)
    }()
    
    static let VoiceWroungPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "答錯音效", withExtension: "mp3")
        else{
            
            fatalError("Failed to find sound file.")
            
        }
        return AVPlayer(url: url)
    }()
    
    static let VoiceNextPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "下一题", withExtension: "mp3")
        else{
            
            fatalError("Failed to find sound file.")
            
        }
        return AVPlayer(url: url)
    }()
    
    func playFromStart() {
        seek(to: .zero)
        play()
    }
    
}


func wordSound(word:String){
    let utterance =  AVSpeechUtterance(string: word)
    
        utterance.pitchMultiplier = 1
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
}

