//
//  ActionLogicEnum.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/19.
//

import Foundation

enum VCName{
    case intro
    case login
    case main
    
}

enum PresentVC{
    case intro
    case login
    case look
    case myInfo
    case friend
}

enum ViewState{
    case viewDidLoad
    case viewWillAppear
}

//enum IntroLogic: Any{
//    case prepareView
//    case nextView
//    case none
//}
//
//enum IntroAction: Any{
//    case timeDone
//    case viewDidLoad
//    case none
//}
//
