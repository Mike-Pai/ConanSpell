//
//  RecordEnterView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI



struct RecordEnterView: View {
    @State var playerName = ""
    @State var saveData = true
    @StateObject var gameRecord = GameRecordData()
    @State var date = Date()
    @Binding var currentPage: pages
    @Binding var useTime: String
    @Binding var correctNumber: Int
    let formatter = DateFormatter()
          
   
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
                VStack{
                    Form{
                        HStack{
                            Text("姓名：")
                            TextField("請輸入姓名", text: $playerName)
                        }
                        HStack{
                            Text("日期：")
//                            Spacer()
                            Text(date, formatter: formatter)
                        }
                        HStack{
                            Text("分數：")
                            Text("共答對 \(correctNumber) 題")
                            Spacer()
                            Text("儲存")
                                .foregroundColor(.blue)
                                .onTapGesture {
//                                    saveData = true
                                    if playerName.isEmpty {
                                        playerName = "無名玩家"
                                    }
                                    let playerdata = GameRecord(number: 0, playerName: playerName, correctNumber: correctNumber, playTime: useTime, DateTime: date)
                                    
                                    gameRecord.gameRecords.append(playerdata)
                                    currentPage = pages.GameRecordView
                                }
                        }
                        
                        
                    }
                    .frame(width: 500, height: 210, alignment: .center)
                    
                    
                    
                    
                }
                
                
                
            }
            
            
            
        }
        .onAppear(){
            formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            //若不要row分隔线的话：
            //                    UITableView.appearance().separatorStyle = .none
        }
    }
}

struct RecordEnterView_Previews: PreviewProvider {
    static var previews: some View {
        RecordEnterView(currentPage: .constant(pages.RecordEnterView), useTime: .constant("60"), correctNumber: .constant(2) )
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
