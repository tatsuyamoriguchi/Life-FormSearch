//
//  DetailViewController.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
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

extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []), let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]), let prettryJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON obejct for prettyPrintedJSONString()")
            return
        }
        print(prettryJSONString)
                
    }
}
