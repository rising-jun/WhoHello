//
//  FriendViewModel.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/28.
//

import Foundation
import RxSwift
import RxCocoa

final class FriendViewModel: ViewModelType{
    var input: Input?
    var output: Output?
    
    private let state = BehaviorRelay<FriendState>(value: FriendState())
    
    struct Input{
        let viewState: Observable<ViewState>?
        let touchedMyInfo: Observable<Void>?
    }
    
    struct Output{
        var state: Driver<FriendState>?
    }
    
    private let disposeBag = DisposeBag()
    
    func bind(input: Input) -> Output{
        self.input = input
            
        input.viewState?
            .filter{$0 == .viewDidLoad}
            .withLatestFrom(state){ viewState, state -> FriendState in
                var newState = state
                newState.viewLogic = .setUpView
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        input.touchedMyInfo?
            .withLatestFrom(state)
            .map{state -> FriendState in
                var newState = state
                newState.presentVC = .myInfo
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        
        output = Output(state: state.asDriver())
        return output!
    }
    
    
}
struct FriendState{
    var presentVC: PresentVC?
    var viewLogic: ViewLogic?
    
    
}


