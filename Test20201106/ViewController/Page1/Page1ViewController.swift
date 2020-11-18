//
//  ViewController.swift
//  Test20201106
//
//  Created by Jay on 2020/11/6.
//

import UIKit

class Page1ViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var requestBtn: UIButton!

    var page1ViewModel: Page1ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        bind()
    }

    func initUI(){
        
    }

    func bind(){
        page1ViewModel = Page1ViewModel()
        requestBtn.addTarget(self, action: #selector(requestBtnAction), for: .touchUpInside)
    }

    @objc func requestBtnAction(){
        do {
            let apiData = try page1ViewModel.requestData()
            if let page2VC = storyboard?.instantiateViewController(withIdentifier: "page2Identify") as? Page2ViewController {
                navigationController?.pushViewController(page2VC, animated: true)
                page2VC.page2ViewModel = Page2ViewModel(apiDatas: apiData)
            }
        } catch {
//            alert something
//            print("error")
        }
    }
}

