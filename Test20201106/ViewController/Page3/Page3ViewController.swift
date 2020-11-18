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

    var page3ViewModel: Page3ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        idLbl.text = "ID: " + page3ViewModel.idLblText
        titleLbl.text = "Title: " + page3ViewModel.titleLblText
        let imageData = urlToimage(url: page3ViewModel.imageURL)
        image.image = imageData
    }

    private func urlToimage(url: URL) -> UIImage? {
        let imageData = try? Data(contentsOf: url)
        if imageData == nil {
            return nil
        }
        let image = UIImage(data: imageData!)
        return image
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
