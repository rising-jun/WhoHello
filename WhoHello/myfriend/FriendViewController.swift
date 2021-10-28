//
//  FriendViewController.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import RxSwift
import RxCocoa
import RxViewController
import UIKit

class FriendViewController: BaseViewController{
    
    lazy var v = FriendView(frame: view.frame)
    
    private let viewModel = FriendViewModel()
    private let disposeBag = DisposeBag()
    lazy var myInfoBtn = UIBarButtonItem()
    
    private let myInfoVC = MyInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private lazy var input = FriendViewModel.Input(viewState: rx.viewDidLoad.map{ViewState.viewDidLoad},
                                                   touchedMyInfo: myInfoBtn.rx.tap.map{_ in Void()})
    private lazy var output = viewModel.bind(input: input)
    
    override func bindViewModel() {
        super.bindViewModel()
        
        output.state?
            .map{$0.viewLogic}
            .filter{$0 == .setUpView}
            .drive(onNext: { [weak self] _ in
            self?.setUpView()
        }).disposed(by: disposeBag)
        
        output.state?
            .map{$0.presentVC ?? .friend}
            .drive(onNext: { [weak self] vc in
                self?.presentVC(vcName: vc)
            })
            .disposed(by: disposeBag)
        
    }
}

extension FriendViewController{
    
    func setUpView(){
        view = v
        self.myInfoBtn.title = "나의카드"
        self.navigationItem.setRightBarButton(self.myInfoBtn, animated: false)
    }
    
    func presentVC(vcName: PresentVC){
        if vcName == .myInfo {
            self.navigationController?.pushViewController(myInfoVC, animated: true)
        }
    }
    
}
