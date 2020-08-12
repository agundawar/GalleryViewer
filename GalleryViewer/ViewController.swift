//
//  ViewController.swift
//  GalleryViewer
//
//  Created by Akhil Gundawar on 08/02/20.
//  Copyright © 2020 Akhil Gundawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePickerController : UIImagePickerController!


    @IBOutlet weak var imageView: UIImageView!

    @IBAction func onLoadGalleryButton(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func onPhotoButton(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func onSavedGalleryButton(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .savedPhotosAlbum
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    @IBAction func onGalleryButton(_ sender: Any) {
        performSegue(withIdentifier: "gallerySegue", sender: self)
    }
    
    func saveImage(imageName: String){
       //create an instance of the FileManager
       let fileManager = FileManager.default
       //get the image path
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       //get the image we took with camera
       let image = imageView.image!
       //get the PNG data for this image
        let data = image.pngData()
       fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//    imagePickerController.dismiss(animated: true, completion: nil)
//    imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        imageView.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

