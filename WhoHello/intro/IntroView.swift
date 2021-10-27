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
        label.text = ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
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
        
        backgroundColor = .yellow
        addSubViews(titleLabel, titleIV, animationView)
        
        //animationView.backgroundColor = .white
        animationView.snp.makeConstraints { make in
            make.center.equalTo(self)
            make.width.height.equalTo(150)
        }
        
        
    }
    
}
