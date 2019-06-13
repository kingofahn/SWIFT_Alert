//
//  ViewController.swift
//  Alert
//
//  Created by kingofahn on 07/06/2019.
//  Copyright © 2019 kingofahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 전구 이미지
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    // 전구 상태
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn == true){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert) // UIAlertController 생성
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil
        ) // UIAlertAction을 생성, 특별한 동작을 하지 않을 경우 nil
            lampOnAlert.addAction(onAction) // 컨트롤러에 생성한 onAction을 추가
            present(lampOnAlert, animated: true, completion: nil)
        }
        else{
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            //UIAlertController 생성
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            // UIAlertAction 생성, {}사이에 action 추가, self붙이지 않으면 에러남
            // Action in은 익명함수 혹은 클로저 임. 함수 이름을 선언하지 않고 바로 함수 몸체만 만들어서 사용하는 일회성 함수(Anonymous Functions) or Closure
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            // UIAlertAction 생성, 특별한 동작이 없으면 nil
            lampOffAlert.addAction(offAction)
            // alert에 생성한 offAction 추가
            lampOffAlert.addAction(cancelAction)
            // alert에 생성한 cancelAction 추가
            present(lampOffAlert, animated: true, completion: nil)
            // present 메서드를 실행하여 알림창 뛰우기
        }
    
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton){
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on).", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default,  handler: {
            ACTION in  self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
}

