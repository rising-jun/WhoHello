//
//  MainView.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import UIKit
import SnapKit

class LookView: BaseView{
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "SNS 로그인을 사용해주세요."
        label.textColor = .magenta
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    

    override func setup() {
        backgroundColor = .white
        
    
    }
    
    
    
}
