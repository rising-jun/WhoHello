//
//  MyInfoViewModel.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/28.
//

import Foundation
import RxSwift
import RxCocoa

final class MyInfoViewModel: ViewModelType{
    var input: Input?
    var output: Output?
    
    private let state = BehaviorRelay<MyInfoState>(value: MyInfoState())
    
    struct Input{
        let viewState: Observable<ViewState>?
        let imageTouched: Observable<Void>?
    // let uploadBtn: Observable<Void>? -> need myInfoStruct
        
    }
    
    struct Output{
        var state: Driver<MyInfoState>?
    }
    
    private let disposeBag = DisposeBag()
    
    func bind(input: Input) -> Output{
        self.input = input
            
        input.viewState?
            .filter{$0 == .viewDidLoad}
            .withLatestFrom(state){ viewState, state -> MyInfoState in
                var newState = state
                newState.viewLogic = .setUpView
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        input.imageTouched?
            .withLatestFrom(state)
            .map{
                var newState = $0
                newState.presentVC = .imagePicker
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        
        
        
        output = Output(state: state.asDriver())
        return output!
    }
    
    
}
struct MyInfoState{
    var presentVC: PresentVC?
    var viewLogic: ViewLogic?
    var imagePicker: Void?
    
}


