//
//  LookViewModel.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import RxSwift
import RxCocoa

final class LookViewModel: ViewModelType{
    var input: Input?
    var output: Output?
    
    private let state = BehaviorRelay<LookState>(value: LookState())
    
    struct Input{
        let timeOver: Observable<Bool>?
        let viewState: Observable<ViewState>?
    }
    
    struct Output{
        var state: Driver<LookState>?
    }
    
    private let disposeBag = DisposeBag()
    
    func bind(input: Input) -> Output{
        self.input = input

        input.timeOver?
            .withLatestFrom(state){ done, state -> LookState in
                var newState = state
                newState.presentVC = .login
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
            
        input.viewState?
            .filter{$0 == .viewDidLoad}
            .withLatestFrom(state){ viewState, state -> LookState in
                var newState = state
                newState.viewLogic = .setUpView
                return newState
            }.bind(to: self.state)
            .disposed(by: disposeBag)
        
        output = Output(state: state.asDriver())
        return output!
    }
    
    
}



struct LookState{
    var vcName: VCName?
    var presentVC: PresentVC?
    var timeOver: Bool?
    var viewLogic: ViewLogic?
    
    
}
