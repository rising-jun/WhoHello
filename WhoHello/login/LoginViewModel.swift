//
//  LoginViewModel.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: ViewModelType{
    var input: Input?
    var output: Output?
    
    private let state = BehaviorRelay<LoginState>(value: LoginState())
    
    struct Input{
        let viewState: Observable<ViewState>?
        let vcName: Observable<VCName>?
    }
    
    struct Output{
        var state: Driver<LoginState>?
    }
    
    private let disposeBag = DisposeBag()
    
    func bind(input: Input) -> Output{
        self.input = input
            
        input.viewState?
            .filter{$0 == .viewDidLoad}
            .withLatestFrom(state){ viewState, state -> LoginState in
                var newState = state
                newState.viewLogic = .setUpView
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        output = Output(state: state.asDriver())
        return output!
    }
    
    
}



struct LoginState{
    var presentVC: PresentVC?
    var viewLogic: ViewLogic?
    
}


enum LoginAction{
    case timeOver
    case vcName
}


