//
//  View.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/19.
//

import Foundation
import SnapKit
import Lottie

class IntroView: BaseView{
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "누구세요?"
        label.textColor = .systemPink
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    lazy var titleIV: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "titleimage")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let animationView = AnimationView(name:"heartlottie")

    override func setup() {
        super.setup()
        
        backgroundColor = .cyan
        addSubViews(titleLabel, titleIV, animationView)
        
        //animationView.backgroundColor = .white
        animationView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
        }
        
        
    }
    
}
