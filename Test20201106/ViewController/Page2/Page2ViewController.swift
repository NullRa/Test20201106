//
//  Page2ViewController.swift
//  Test20201106
//
//  Created by Jay on 2020/11/7.
//

import UIKit

class Page2ViewController: UIViewController {

    var page2ViewModel: Page2ViewModel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        bind()
    }

    func initUI(){

    }

    func bind(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func urlToimage(url: URL) -> UIImage? {
        let imageData = try? Data(contentsOf: url)
        if imageData == nil {
            return nil
        }
        let image = UIImage(data: imageData!)
        return image
    }

}

extension Page2ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return page2ViewModel.getDatasCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        let index = indexPath.row
        cell.idLbl.text = String( page2ViewModel.getDataID(index: index))
        cell.titleLbl.text = page2ViewModel.getDataTitle(index: index)
        let imgURL = page2ViewModel.getDataThumbnailUrl(index: index)
        let size = self.view.frame.width/4 - 8
        cell.image.image = urlToimage(url: imgURL)!.reSizeImage(reSize: CGSize(width: size, height: size))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{

        //        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular{
        //            //iphone直向
        //            return CGSize(width: 160, height: 160)
        //        }
        let size = self.view.frame.width/4 - 8
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let page3VC = storyboard?.instantiateViewController(withIdentifier: "page3Identify") as? Page3ViewController {
            navigationController?.pushViewController(page3VC, animated: true)
//            page2VC.page2ViewModel = Page2ViewModel(apiDatas: apiData)
            let index = indexPath.row
            page3VC.idLblText = String(page2ViewModel.getDataID(index: index))
            page3VC.titleLblText = page2ViewModel.getDataTitle(index: index)

            let imgURL = page2ViewModel.getDataUrl(index: index)
//            let size = self.view.frame.width/4 - 8
//            cell.image.image = urlToimage(url: imgURL)!.reSizeImage(reSize: CGSize(width: size, height: size))
            page3VC.imageData = urlToimage(url: imgURL)
        }
    }
}
