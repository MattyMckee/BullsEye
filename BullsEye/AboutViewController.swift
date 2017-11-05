//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Matthew McKee on 05/11/2017.
//  Copyright © 2017 Matthew McKee. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url){
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                webview.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
