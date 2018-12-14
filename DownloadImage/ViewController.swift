//
//  ViewController.swift
//  DownloadImage
//
//  Created by Vattanac on 12/14/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,URLSessionDownloadDelegate,URLSessionDelegate {
    
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://hdqwalls.com/wallpapers/mountains-iceland-4k-11.jpg")
        let urlsession = URLSession.init(configuration: .default, delegate: self, delegateQueue: nil)
        urlsession.downloadTask(with: url!).resume()
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let image = UIImage(data:try! Data.init(contentsOf: location))
        DispatchQueue.main.sync {
            self.image.image = image
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let load = Float(totalBytesWritten)*100/Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.label.text = String("\(load)%")
        }
    }


}

