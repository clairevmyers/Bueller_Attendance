//
//  TakeAttendanceView.swift
//  Bueller Attendance
//
//  Created by Grace Hansen on 3/1/18.
//  Copyright © 2018 District196. All rights reserved.
//

import UIKit
import AVFoundation
class TakeAttendanceView: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var banner1: UIView!
    @IBOutlet weak var banner2: UIView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var confirmationMessage: UILabel!
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //creating session
        let session = AVCaptureSession()
        
        //define capture device
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch
        {
            print("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: confirmationMessage)
        self.view.bringSubview(toFront: groupName)
        self.view.bringSubview(toFront: banner1)
        self.view.bringSubview(toFront: banner2)
        
        session.startRunning()
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    {
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    let message = "\(String(describing: object.stringValue))"
                    let firstHalf = message.dropFirst(10)
                    let finalString = firstHalf.dropLast(2)
                    confirmationMessage.text = " Student \(finalString) has checked in!"
                }
            }
        }
}
}
