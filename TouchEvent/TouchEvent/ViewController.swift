//
//  ViewController.swift
//  TouchEvent
//
//  Created by Haruma Ito on 2024/02/03.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, PHPickerViewControllerDelegate {
    
    @IBOutlet var backgroudImageView: UIImageView!
    
    var selectedImageName: String = "flower"
    
    var imageViewArray: [UIImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: view)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.image = UIImage(named: selectedImageName)
        imageView.center = CGPoint(x: location.x, y: location.y)
        
        view.addSubview(imageView)
        
        imageViewArray.append(imageView)
    }

    @IBAction func selectImage1() {
        selectedImageName = "flower"
    }
    
    @IBAction func selectImage2() {
        selectedImageName = "cloud"
    }
    
    @IBAction func selectImage3() {
        selectedImageName = "heart"
    }
    
    @IBAction func selectImage4() {
        selectedImageName = "star"
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        
        // ここのif分あんまり理解できんな
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            // これコールバックメソッドを引数外に出しているのか？
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.backgroudImageView.image = image as? UIImage
                }
            }
        }
        
        // 一つ選択したら閉じるようにしている
        dismiss(animated: true)
    }
    
    @IBAction func changeBackgroud() {
        var configuration = PHPickerConfiguration()
        
        let filter = PHPickerFilter.images
        configuration.filter = filter
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    @IBAction func save() {
        UIGraphicsBeginImageContextWithOptions(backgroudImageView.frame.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: -backgroudImageView.frame.origin.x, y: -backgroudImageView.frame.origin.y)
        view.layer.render(in: context)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }
    
    @IBAction func undo() {
        if !imageViewArray.isEmpty {
            imageViewArray.last!.removeFromSuperview()
            imageViewArray.removeLast()
        }
    }
}

