//
//  MyInfoViewController.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/28.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxViewController

class MyInfoViewController: BaseViewController{
    
    lazy var v = MyInfoView(frame: view.frame)
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        
    }
    
    private let viewModel = MyInfoViewModel()
    //private lazy var input = MyInfoViewModel.Input(viewState: rx.viewDidLoad.map{ViewState.viewDidLoad})
    //private lazy var output = viewModel.bind(input: input)
    
    override func bindViewModel() {
        super.bindViewModel()
//        output.state?
//            .map{$0.viewLogic}
//            .distinctUntilChanged()
//            .filter{$0 == .setUpView}
//            .drive(onNext: { [weak self] _ in
//                self?.setUpView()
//            })
//            .disposed(by: disposeBag)
//
        
        
    }
    

}
extension MyInfoViewController{
    
    func setUpView(){
        view = v
    }
    
}
