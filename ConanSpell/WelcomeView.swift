//
//  WelcomeView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI
import AVFoundation

struct WelcomeView: View {
    
    @Binding var currentPage:pages
    
    @State private var viewAnimationOpacity = 1.0
    @State private var showStartText = false
    //音效處理：背景音樂播放的切換
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
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("角色拼拼樂")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.horizontal, 6.0)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                    .scaleEffect(2.5)
                    .offset(x: 10, y: -15)
                    .shadow(radius: 30)
                    .background(
                        Image("彌豆子")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(Angle(degrees: -30))
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: -185, y: -70)
                    )
                    .background(
                        Image("善逸")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(Angle(degrees: 30))
                            .frame(width: 90, height: 90, alignment: .center)
                            .offset(x: 190, y: -70)
                    )
                
                
                
                Spacer()
                VStack{
                    if showStartText == true{
                        Text("Touch to Start！")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .offset(x: 15, y: 50)
                            .foregroundColor(.red)
                            .transition(.scale(scale: 1.05))
                            .animation(
                                .linear(duration: 0.5)
                                    .repeatForever(autoreverses: true)
                            )
                        
                    }
                }
                .animation(
                    .linear
                        .repeatForever(autoreverses: true)
                )
                Spacer()
            }
            .opacity(viewAnimationOpacity)
            .animation(.easeOut)
            
            
            
            
            
        }
        
        .onAppear{
            showStartText = true
            AVPlayer.setupBgMusic()
            AVPlayer.bgQueuePlayer.play()
            AVPlayer.bgQueuePlayer.volume = 0.3
        }
        .onTapGesture {
            viewAnimationOpacity = 0
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                currentPage = pages.PlayGameView
            }
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(currentPage: .constant(pages.WelcomeView))
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
