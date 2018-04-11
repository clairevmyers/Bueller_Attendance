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

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var banner1: UIView!
    @IBOutlet weak var banner2: UIView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var confirmationMessage: UILabel!
    var video = AVCaptureVideoPreviewLayer()
    var groupString = String()
    var ID = String()
    
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

        //print(groupString)
        groupName.text = currentGroup
        
        self.view.bringSubview(toFront: confirmationMessage)
        self.view.bringSubview(toFront: groupName)
        self.view.bringSubview(toFront: banner1)
        self.view.bringSubview(toFront: banner2)
        
        session.startRunning()
        

        
    }
    
    @IBAction func addStudent(_ sender: Any){
        
        }
    func checkQR(groupName: String, code: String) -> BooleanLiteralType
    {
        var here = false
        let temp = groupDict[currentGroup]?.studentList
        for Student in (temp)!
        {
            if Student.StudentID == code
            {
                Student.AttendanceStatus = "P"
                here = true
            }
        }
        
        
        return here
    }
    @IBOutlet weak var addStudent: UIButton!
    
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
                    let finalString = String(firstHalf.dropLast(2))
                    ID = finalString
                    
                    var validQR = checkQR(groupName: groupName.text!, code:finalString)
                    
                    if(validQR == true)
                    {
                        confirmationMessage.text = " Student \(finalString) has checked in!"
                    }
                    
                    else if (finalString.count == 6)
                    {
                        
                        confirmationMessage.text = " Want to add student \(finalString)?"
                        addButton.setTitleColor(UIColor.white, for: .normal)
                        addButton.isEnabled = true
                    }

                }
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            print("preparing")
            
            if(segue.identifier == "takeAttendanceToGroupPage")
            {
                let view = segue.destination as? GroupPage
        
            }
            else if(segue.identifier == "takeAttendanceToStudent")
            {
                let view = segue.destination as? StudentView
                view?.returnTo = "Attendance"
                newID = ID
                
            }
    
        }

}
