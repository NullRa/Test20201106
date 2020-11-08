//
//  Page3ViewController.swift
//  Test20201106
//
//  Created by Jay on 2020/11/8.
//

import UIKit

class Page3ViewController: UIViewController {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var image: UIImageView!

    var idLblText: String!
    var titleLblText: String!
    var imageData: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        idLbl.text = "ID: " + idLblText
        titleLbl.text = "Title: " + titleLblText
        image.image = imageData
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
