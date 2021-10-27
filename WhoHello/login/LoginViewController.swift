//
//  LoginViewController.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import RxSwift
import RxViewController

class LoginViewController: BaseViewController {
    
    lazy var v = LoginView(frame: view.frame)
    lazy var viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    lazy var input = LoginViewModel.Input(viewState: rx.viewDidLoad.map{ViewState.viewDidLoad},
                                          vcName: Observable.just(VCName.intro))
    lazy var output = viewModel.bind(input: input)
    
    
    override func bindViewModel(){
        super.bindViewModel()
        
        output.state?.map{$0.viewLogic}
            .filter{$0 == .setUpView}
            .distinctUntilChanged()
            .drive(onNext: { [weak self] logic in
            self?.setUpView()
        }).disposed(by: disposeBag)
        
        output.state?.map{$0.presentVC ?? .login}
            .distinctUntilChanged()
            .drive(onNext: { [weak self] presentVC in
            self?.presentVC(vcName: presentVC)
        }).disposed(by: disposeBag)
        
    }
    
}
extension LoginViewController{
    
    func setUpView(){
        view = v
    }
    
    func presentVC(vcName: PresentVC){
        switch vcName {
            
        case .intro:
            //present(IntroViewController(), animated: true, completion: nil)
        break
        case .login:
            //present(LoginViewController(), animated: true, completion: nil)
        break
        case .main:
            //present(IntroViewController(), animated: true, completion: nil)
        break
        }
    }
    
}

