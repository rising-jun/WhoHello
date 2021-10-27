//
//  LoginViewController.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/27.
//

import Foundation
import RxSwift
import RxViewController
import RxGesture

class LoginViewController: BaseViewController {
    
    lazy var v = LoginView(frame: view.frame)
    let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    let lookVC = LookViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    private lazy var input = LoginViewModel.Input(viewState: rx.viewDidLoad.map{ViewState.viewDidLoad},
                                                  googleLoginTap: self.v.googleBtn.rx.tapGesture().skip(1).map{ _ in return Void()} )
    private lazy var output = viewModel.bind(input: input)
    
    
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
        UIApplication.shared.windows.first?.rootViewController = self
    }
    
    func presentVC(vcName: PresentVC){
        switch vcName {
            
        case .intro:
            //present(IntroViewController(), animated: true, completion: nil)
        break
        case .login:
            //present(LoginViewController(), animated: true, completion: nil)
        break
        case .look:
            lookVC.modalPresentationStyle = .fullScreen
            present(lookVC, animated: true, completion: nil)
        break
        }
    }
    
}

