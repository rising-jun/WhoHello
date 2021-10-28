//
//  ImagePickerDelegate.swift
//  WhoHello
//
//  Created by 김동준 on 2021/10/28.
//

import Foundation
import UIKit

protocol GiveImage{
    func takeImage(_ image: UIImage)
}

class ImagePickerDelegate: NSObject {
    public var imageProtocol: GiveImage!
    
}

extension ImagePickerDelegate: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(" i called and take new image hi! ")
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        print(" imageProtocol.takeImage(newImage!)")
        imageProtocol.takeImage(newImage!)
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}
