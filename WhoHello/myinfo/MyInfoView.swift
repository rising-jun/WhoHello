//
//  MyInfoView.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/28.
//

import Foundation
import SnapKit
import UIKit

class MyInfoView: BaseView{
    
    lazy var tripImage = UIImageView()
    lazy var contents = UITextField()
    lazy var dateAddLabel = UILabel()
    lazy var locAddLabel = UILabel()
    lazy var locInputTF = UITextField()
    lazy var categoryLabel = UILabel()
    lazy var publicSet = UISwitch()
    lazy var publicLabel = UILabel()
    
    
    let locationLayout = UICollectionViewFlowLayout()
    lazy var locationSet = UICollectionView(frame: .zero, collectionViewLayout: locationLayout)
    
    let categoryLayout = UICollectionViewFlowLayout()
    lazy var categorySet = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)
    lazy var dateSet = UIDatePicker()
    
    
    override func setup() {
        super.setup()
        backgroundColor = .black
        
        addSubViews(tripImage, contents, dateAddLabel, locAddLabel, locInputTF, locationSet, publicSet, categorySet, dateSet, publicLabel, categoryLabel)

        tripImage.backgroundColor = .green
        tripImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalTo(15)
        }
        contents.attributedPlaceholder = NSAttributedString(string: "placeholder text",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        contents.textAlignment = .left
        contents.font = .systemFont(ofSize: 18)
        contents.backgroundColor = .black
        contents.layer.cornerRadius = 10
        contents.placeholder = "내용을 입력해주세요.."
        contents.textColor = .white
        contents.snp.remakeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(tripImage.snp.trailing).offset(15)
            make.trailing.equalTo(self).offset(-15)
            make.height.equalTo(100)
        }
        
        
        dateAddLabel.text = "날짜 선택"
        dateAddLabel.textColor = .white
        dateAddLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dateAddLabel.snp.makeConstraints { make in
            make.top.equalTo(tripImage.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        
        dateSet.translatesAutoresizingMaskIntoConstraints = false
        dateSet.preferredDatePickerStyle = .wheels
        dateSet.snp.makeConstraints { make in
            make.top.equalTo(contents.snp.bottom).offset(30)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(100)
        }
        
        locAddLabel.text = "위치 추가"
        locAddLabel.textColor = .white
        locAddLabel.font = UIFont.boldSystemFont(ofSize: 18)
        locAddLabel.snp.makeConstraints { make in
            make.top.equalTo(dateSet.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(15)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        
        locInputTF.textAlignment = .left
        locInputTF.font = .systemFont(ofSize: 18)
        locInputTF.backgroundColor = .black
        locInputTF.layer.cornerRadius = 10
        locInputTF.attributedPlaceholder = NSAttributedString(string: "placeholder text",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray6])
        locInputTF.placeholder = "위치를 입력해주세요..."
        locInputTF.textColor = .white
        locInputTF.snp.makeConstraints { make in
            make.top.equalTo(locAddLabel.snp.bottom).offset(10)
            make.left.equalTo(15)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        locationSet.backgroundColor = .blue
        locationSet.snp.makeConstraints { make in
            make.top.equalTo(locInputTF.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(15)
            make.trailing.equalTo(self).offset(-15)
            make.height.equalTo(50)
        }
        
        
        categoryLabel.text = "카테고리 추가"
        categoryLabel.textColor = .white
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 18)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(locationSet.snp.bottom).offset(30)
            make.left.equalTo(15)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        categorySet.backgroundColor = .yellow
        categorySet.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(15)
            make.trailing.equalTo(self).offset(-15)
            make.height.equalTo(50)
        }
        
        publicLabel.text = "공개"
        publicLabel.textColor = .white
        publicLabel.font = UIFont.boldSystemFont(ofSize: 18)
        publicLabel.snp.makeConstraints { make in
            make.top.equalTo(categorySet.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(15)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        
        publicSet.backgroundColor = .black
        publicSet.snp.makeConstraints { make in
            make.top.equalTo(publicLabel.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(15)
            make.width.equalTo(80)
        }
    
        
        
    }
    
}
