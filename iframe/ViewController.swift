//
//  ViewController.swift
//  iframe
//
//  Created by David on 8/16/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var toolBar: UIToolbar!
    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://www.google.com");
        let requestObj = NSURLRequest(url: url! as URL);
        webView.load(requestObj as URLRequest);
        
        self.navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
//        items.append(
//            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        )
        let btn1 = UIButton(type: .system)
        btn1.setImage(UIImage(named: "home"), for: .normal)
        btn1.setTitle("Home", for: .normal)
//        btn1.setTitleColor(UIColor.black, for: .normal)
        btn1.addTarget(self, action: #selector(doSomething), for: .touchUpInside)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        //btn1.titleEdgeInsets = UIEdgeInsetsMake(0, -60, -30, 0);
        //btn1.imageEdgeInsets = UIEdgeInsetsMake(-15, 0 , 0, 0);
        btn1.sizeToFit()
        btn1.alignVertical()
        let item1 = UIBarButtonItem(customView: btn1)
        items.append(
            item1
        )
        self.toolBar.items = items
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doSomething() {
        print(124)
    }

}

extension UIButton {
    func alignVertical(spacing: CGFloat = 6.0) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}
