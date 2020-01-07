//
//  ViewController.swift
//  CameraTest1
//
//  Created by 藤崎達也 on 2020/01/05.
//  Copyright © 2020 藤崎達也. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ↓↓↓↓↓ カメラが使えるかどうか確認するコード　カメラがあれば、特には何もしない ↓↓↓↓↓
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alertController = UIAlertController.init(title: nil, message: "No Camera availale", preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in})
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        // ↑↑↑↑↑ カメラが使えるかどうか確認するコード　カメラがあれば、特には何もしない ↑↑↑↑↑
    }
    
    
    @IBAction func takePicture(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerController.SourceType.camera
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func savePicture(_ sender: UIButton) {
        // 写真の保存は今は実装しない
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picker.dismiss(animated:true, completion: nil)
            imageView.contentMode = .scaleToFill
            
            // captureImageは静止画になる
            
            let grayCaptureImage = OpenCV.grayScale(captureImage)
            
            // キャプチャした画像をイメージビューに貼り付ける
            imageView.image = grayCaptureImage
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

}

