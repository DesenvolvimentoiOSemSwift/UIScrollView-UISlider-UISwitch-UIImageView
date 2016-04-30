//
//  DetailViewController.swift
//  Aula 7
//
//  Created by Mauricio Meirelles on 9/11/14.
//  Copyright (c) 2014 Mauricio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var onOffZoom: UISwitch!
    
    var imgSelected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.zoomScale = 1
        

        imageView.image = UIImage(named: imgSelected!)
        imageView.sizeToFit()
    }
    
    override func viewWillLayoutSubviews() {
        
        scrollView.contentSize = imageView.frame.size
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    @IBAction func changeValue(sender: UISlider) {
        scrollView.zoomScale = CGFloat(slider.value)
    }

    func scrollViewDidZoom(scrollView: UIScrollView)
    {
        slider.setValue(Float(scrollView.zoomScale), animated: true)
    }
    
    @IBAction func turnOnOff(sender: AnyObject) {
        slider.enabled = onOffZoom.on
        
        scrollView.pinchGestureRecognizer!.enabled = onOffZoom.on
    }
    

}
