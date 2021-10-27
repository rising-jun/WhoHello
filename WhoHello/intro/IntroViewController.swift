//
//  ViewController.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/19.
//

import UIKit
import RxSwift
import RxViewController
import Lottie

class IntroViewController: BaseViewController {
    
    lazy var v = IntroView(frame: view.frame)
    lazy var viewModel = IntroViewModel()
    private let disposeBag = DisposeBag()
    
    let loginVC = LoginViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    lazy var input = IntroViewModel.Input(timeOver: Observable<Int>
                                            .interval(.seconds(4), scheduler: MainScheduler.instance)
                                            .take(1)
                                            .map{_ in return true},
                                          viewState: rx.viewDidLoad.map{ViewState.viewDidLoad},
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
        
        output.state?.map{$0.presentVC ?? .intro}
            .distinctUntilChanged()
            .drive(onNext: { [weak self] presentVC in
            self?.presentVC(vcName: presentVC)
        }).disposed(by: disposeBag)
        
    }
    
}
extension IntroViewController{
    
    func setUpView(){
        view = v
        v.animationView.loopMode = .playOnce
        v.animationView.play()
    }
    
    func presentVC(vcName: PresentVC){
        switch vcName {
            
        case .intro:
            //present(IntroViewController(), animated: true, completion: nil)
        break
        case .login:
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        break
        case .look:
            //present(IntroViewController(), animated: true, completion: nil)
        break
        }
    }
    
}

