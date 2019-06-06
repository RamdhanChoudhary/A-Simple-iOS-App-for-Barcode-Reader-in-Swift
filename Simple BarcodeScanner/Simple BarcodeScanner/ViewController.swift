//
//  ViewController.swift
//  Simple BarcodeScanner
//
//  Created by RAMDHAN CHOUDHARY on 06/06/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit
import BarcodeScanner

class ViewController: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {

    @IBOutlet weak var barcodeTxtLabel: UILabel!
    @IBOutlet weak var barcodeValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barcodeTxtLabel.isHidden = true
        barcodeValueLabel.isHidden = true
    }
    
    
    
    @IBAction func startBarcodeScan(_ sender: Any) {
        barcodeTxtLabel.isHidden = true
        barcodeValueLabel.isHidden = true
        
        let viewController = BarcodeScannerViewController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        
        present(viewController, animated: true, completion: nil)
    }
    

    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("Product's Bar code is :", code)
        barcodeTxtLabel.isHidden = false
        barcodeValueLabel.isHidden = false
        barcodeValueLabel.text = code
        
        //controller.reset()
        //controller.reset(animated: true)
        controller.dismiss(animated: true, completion: nil)
    }

    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        barcodeTxtLabel.isHidden = false
        barcodeValueLabel.isHidden = false
        barcodeValueLabel.text = error.localizedDescription
        print(error)
    }

    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

