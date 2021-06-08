//
//  PageControllerView.swift
//  ConanSpell
//
//  Created by 白謹瑜 on 2021/6/7.
//

import SwiftUI

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

enum pages{
    case WelcomeView, PlayGameView, GameoverView, RecordEnterView, GameRecordView, FinishGameView
}
struct PageControllerView: View {
    @State var currentPage = pages.WelcomeView
    @State var showWelcome = true
    @State var showPlayGameView = true
    @State var correctNumber = 0
    @State var useTime = ""
    var body: some View {
        ZStack{
            switch currentPage
            {
                case pages.WelcomeView: WelcomeView(currentPage: $currentPage)
            case pages.PlayGameView: PlayGameView(currentPage: $currentPage, correctNumber: $correctNumber, useTime: $useTime)
            case pages.GameoverView: GameOverView(currentPage:  $currentPage)
            case pages.RecordEnterView: RecordEnterView(currentPage: $currentPage, useTime: $useTime, correctNumber: $correctNumber)
            case pages.GameRecordView: GameRecordView( currentPage: $currentPage)
            case pages.FinishGameView: FinishGameView(currentPage: $currentPage)
            }
        }
    }
}

struct PageControllerView_Previews: PreviewProvider {
    static var previews: some View {
        PageControllerView()
            .previewLayout(.fixed(width: 896, height: 414))
    }
}
