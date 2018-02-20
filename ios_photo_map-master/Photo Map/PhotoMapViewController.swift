//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Nicholas Aiwazian on 10/15/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var myImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        //one degree of latitude is approximately 111 kilometers (69 miles) at all times.
        let sfRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.783333, -122.416667),
                                              MKCoordinateSpanMake(0.1, 0.1))
        mapView.setRegion(sfRegion, animated: false)
    }
    
    @IBAction func CamButton(_ sender: UIButton) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("")
            vc.sourceType = camera
        } else {
            print("")
            vc.sourceType = photoLibrary
        }
        
        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue1" {
            let vc = segue.destination as! LocationsViewController
            vc.delegate = self
        }
        if segue.identifier == "Segue2" {
            let vc = segue.destination as! FullImageViewController
            vc.image = myImage
        }
    }
    

}
