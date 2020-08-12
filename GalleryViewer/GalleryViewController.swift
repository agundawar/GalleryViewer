//
//  GalleryViewController.swift
//  GalleryViewer
//
//  Created by Akhil Gundawar on 08/02/20.
//  Copyright © 2020 Akhil Gundawar. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    func getImage(imageName: String){
       let fileManager = FileManager.default
       let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       if fileManager.fileExists(atPath: imagePath){
          imageView.image = UIImage(contentsOfFile: imagePath)
       }else{
          print("Panic! No Image!")
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "test.png")

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
