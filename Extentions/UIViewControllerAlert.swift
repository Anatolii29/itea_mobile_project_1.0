//
//  UIViewControllerAlert.swift
//  itea_project
//
//  Created by Anatolii on 6/1/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentWarningOneAction(message: String) {
        
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: false, completion: nil)
        
    }
    
    func presentWarningTwoActions (message: String, completion:@escaping (_ result:Bool) -> Void) {
        
        let alert = UIAlertController(title: "Attention", message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            completion(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completion(false)
        }))
    }
    
}
