//
//  MainTableViewController.swift
//  TakeHome
//
//  Created by Nick on 9/30/17.
//  Copyright © 2017 ZipRealty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MainTableViewController: UITableViewController {
    var results = [myPhoto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset.top = 20
        self.tableView.scrollIndicatorInsets.top = 20
        
        //register custom class
        self.tableView.register(myTableViewCell.self, forCellReuseIdentifier: "cell")

        //load data from url
        LoadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        let result = results[indexPath.row]
        cell.customLabel.text = "\(indexPath.row)-\(result.photoTitle!)"
        cell.customImageView.loadImageUsingCache(withUrl: result.photoThumbnailUrl!)
        

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
}

extension MainTableViewController{
    func LoadData()  {
        //Load data
        let urlstr = "https://jsonplaceholder.typicode.com/photos"
        Alamofire.request(urlstr, method: .get, parameters: nil, encoding: URLEncoding.default , headers: nil).responseJSON(completionHandler:{
            response in
            
            if response.result.isFailure {
                return
            }
            
            let swiftyJsonVar = JSON(response.result.value!)
            if let resData = swiftyJsonVar[].array {
                for list in resData {
                    if let listdetail = list[].dictionary {
                        var tmpAr = myPhoto()
                        tmpAr.photoId = listdetail["id"]?.intValue ?? 0
                        tmpAr.photoTitle = listdetail["title"]?.stringValue ?? ""
                        tmpAr.photoThumbnailUrl = listdetail["thumbnailUrl"]?.stringValue ?? ""
                        
                        self.results.append(tmpAr)
                    }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
            
        })
    }
}
