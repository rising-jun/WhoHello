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
import BSImagePicker
import Photos


class MyInfoViewController: BaseViewController{
    
    lazy var v = MyInfoView(frame: view.frame)
    private let disposeBag = DisposeBag()
    
    private weak var delegate: ImageScrollDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = v
        delegate = ImageScrollDelegate(pageControl: v.pageControl)
        v.imageScroll.delegate = ImageScrollDelegate(pageControl: v.pageControl)
    }
    
    private let viewModel = MyInfoViewModel()
    private lazy var input = MyInfoViewModel.Input(viewState: rx.viewDidLoad.map{ViewState.viewDidLoad},
                                                   imageTouched: v.imageScroll.rx.tapGesture().skip(1).map{_ in Void()})
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
            .map{$0.presentVC ?? .myInfo}
            .drive(onNext: { [weak self] vc in
                self?.presentVC(vcName: vc)
            })
            .disposed(by: disposeBag)
        
    }
    
    
}
extension MyInfoViewController{
    
    func setUpView(){
        view = v
    }
    
    func presentVC(vcName: PresentVC){
        if vcName == .imagePicker{
            let imagePicker = ImagePickerController()
            imagePicker.settings.selection.max = 5
            imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
            self.presentImagePicker(imagePicker, select: { (asset) in
                
                // User selected an asset. Do something with it. Perhaps begin processing/upload?
                
            }, deselect: { (asset) in
                // User deselected an asset. Cancel whatever you did when asset was selected.
                
            }, cancel: { (assets) in
                // User canceled selection.
                
            }, finish: {[weak self] (assets) in
                // User finished selection assets.
                var imageArr: [UIImage] = []
                for i in 0..<assets.count {
                    let imageManager = PHImageManager.default()
                    let option = PHImageRequestOptions()
                    option.isSynchronous = true
                    var thumbnail = UIImage()
                    
                    imageManager.requestImage(for: assets[i],
                                                 targetSize: CGSize(width: 200, height: 200),
                                                 contentMode: .aspectFit,
                                                 options: option) { (result, info) in
                        thumbnail = result!
                        
                        
                    }
                    let data = thumbnail.jpegData(compressionQuality: 0.7)
                    let newImage = UIImage(data: data!)
                    imageArr.append(newImage!)
                }
                self?.v.addImageInScroll(imageArr: imageArr)
                
                
            })
            
            
        }
    }
    
}
