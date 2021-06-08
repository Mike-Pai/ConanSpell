//
//  GameSettingView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI
import AVFoundation

struct GameSettingView: View {
    @Binding var currentPage:pages
    @State private var voiceSlide = AVPlayer.bgQueuePlayer.volume
    @Binding var showGameSettingView:Bool
    @ObservedObject var gameTime : GameTimer
    var body: some View {
        ZStack{
            Image("Image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack{
                    
                        Text("系統設置")
                            .font(.title)
                            .fontWeight(.heavy)
                            .background(Color.yellow.opacity(0.8))
                    HStack{
                        Label(
                            title: { Text("音效") },
                            icon: {
                                Image("Voice")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        Slider(value: $voiceSlide){_ in
                            AVPlayer.bgQueuePlayer.volume = Float(voiceSlide)
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        showGameSettingView = false
                        gameTime.timerContinue()
                    }) {
                        Text("繼續遊戲")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.red)
                            )

                    }
                    Spacer()
                    Button(action: {
                        currentPage = pages.WelcomeView
                    }) {
                        Text("返回主頁")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )

                    }
                    Spacer()
                    Button(action: {
                        currentPage = pages.GameRecordView
                    }) {
                        Text("排行榜")
                            .padding(.all, 10.0)
                            .foregroundColor(.white)
                            .background(
                                Capsule()
                                    .foregroundColor(.blue)
                            )

                    }
                    Spacer()
                }

                Spacer()
            }
        }
        
    }
}

struct GameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingView(currentPage: .constant(pages.PlayGameView), showGameSettingView: .constant(false), gameTime: GameTimer())
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
