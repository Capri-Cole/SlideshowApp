//
//  ExpantionViewController.swift
//  SlideshowApp
//
//  Created by CapriCole on 2021/03/29.
//

import UIKit

class ExpantionViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    //画像名格納用
    var imageName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let targetImage = UIImage(named:imageName)
        imageView.image = targetImage
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
