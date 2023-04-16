//
//  RedfinViewController.swift
//  MortgageCalculator
//
//  Created by Ramon Martinez on 2/10/23.
//

import UIKit
import WebKit

class RedfinViewController: UIViewController {
    @IBOutlet weak var mainWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let redfinURL = URL(string: "https://www.redfin.com")
        let webRequest = URLRequest(url: redfinURL!)
        mainWebView.load(webRequest)
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
