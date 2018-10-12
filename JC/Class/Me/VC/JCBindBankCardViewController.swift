//
//  JCBindBankCardViewController.swift
//  JC
//
//  Created by 赵申侃 on 2018/5/16.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

import UIKit
import AssetsLibrary

class JCBindBankCardViewController: JCBaseViewController{

    var mainView:JCBindBankCardView!
    var cameraType = 0
    var photoPath1:String = ""
    var photoPath2:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "绑定银行卡"
        self.initView()
    }


    func initView()  {
        mainView = JCBindBankCardView.init(frame: CGRect.init(x: 0, y: 0, width: kscreenW, height: kscreenH - CGFloat(kNaviBarHeight)))
        self.view.addSubview(mainView)
        mainView.bankItem.clickBtn.addTarget(self, action: #selector(chooseBank), for: .touchUpInside)
        mainView.sureBtn.addTarget(self, action: #selector(sure), for: .touchUpInside)
        mainView.idCardBtn.addTarget(self, action: #selector(chooseIdCard1), for: .touchUpInside)
        mainView.idCardBtn2.addTarget(self, action: #selector(chooseIdCard2), for: .touchUpInside)
        mainView.verifyCode.timerBtn.addTarget(self, action: #selector(postVerifyCode), for: .touchUpInside)

    }
    
    @objc func chooseBank(){
        let bankArr:[String] = ["中国农业银行", "招商银行", "中国工商银行", "中国建设银行","中国银行", "浦发银行", "中国交通银行", "中国民生银行", "深圳发展银行", "广东发展银行", "中信银行", "华夏银行", "兴业银行","上海银行", "浙商银行", "平安银行", "宁波银行", "东亚银行", "中国光大银行", "南京银行", "中国邮政储蓄银行", "徽商银行","北京银行", "北京农商银行", "渤海银行", "杭州银行", "上海农村商业银行"]
        let controller = UIAlertController(title: "选择银行", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        bankArr.forEach { text in
            let action = UIAlertAction(title: text, style: UIAlertAction.Style.default) { (paramAction:UIAlertAction!) -> Void in
                self.mainView.bankItem.textFiled.text = text;
            }
            controller.addAction(action)
        }
        
        let dismissAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel) { (paramAction:UIAlertAction!) -> Void in
            return
        }
        controller.addAction(dismissAction)
        self.present(controller, animated: true) {
            
        }
        
    }
    
    @objc func chooseIdCard1() {
        cameraType = 0;
        self.showCamera()
    }
    
    @objc func chooseIdCard2() {
        cameraType = 1;
        self.showCamera()
    }
    
    @objc func sure() {
        
        
        if (mainView.bankItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请选择银行")
        } else if (mainView.cardNumItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的银行卡号")
        } else if (mainView.userNameItem.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入您的真实姓名")
        } else if (mainView.verifyCode.textFiled.text?.isEmpty)! {
            return MBProgressHUD.showError("请输入收到的验证码")
        } else if (self.photoPath1.isEmpty ) {
            return MBProgressHUD.showError("请上传你的身份证正面")
        } else if (self.photoPath2.isEmpty) {
            return MBProgressHUD.showError("请上传你的银行卡正面")
        }
        
//        let params = ["userCode":JCUserInfo.share.userid,
//                      "realName":mainView.userNameItem.textFiled.text ?? "",
//                      "cardNo":mainView.cardNumItem.textFiled.text ?? "",
//                      "bankName":mainView.bankItem.textFiled.text ?? "",
//                      "validCode":mainView.verifyCode.textFiled.text ?? "",
//                      "idCardFront" :self.photoPath1,
//                      "cardFront" :self.photoPath2,
//                      "idCardBack":self.photoPath1,
//                      "cardBack":self.photoPath2] as [String : Any];
//
//        JCHttpClient.defult.postRequestImageWithFormData(path:  "/front/user/bindCard", parameter: params, complection: { (response) in
//
//            do {
////                let homeModel = try JSONDecoder().decode(JCHomeModel.self, from: response)
////                homeModel.data.forEach({
////                    self.dataArr.append($0);
////                })
////                self.tableView.reloadData()
//            } catch {
//                print(error.localizedDescription)
//            }
//
//        }) { (error) in
//
//        }
        
    }
    
    @objc func postVerifyCode() {
        
        self.view.endEditing(true)
//        let params = ["phone":JCUserInfo.share.phone ?? ""];
//        JCHttpClient.defult.postRequestWithFormData(path:  "/front/sms/smsCode", parameter: params, complection: { (response) in
//            do {
//                _ = try JSONDecoder().decode(JCBaseModel.self, from: response)
//                self.mainView.verifyCode.startTime()
//            } catch {
//                print(error.localizedDescription)
//            }
//            
//        }) { (error) in
//            
//        }
    }
    
    func showCamera() {
        self.view.endEditing(true)
        let alertController = UIAlertController(title:nil, message:nil, preferredStyle: .actionSheet);
        let oneAction = UIAlertAction(title: "拍照", style: .default) { (_) in
            self.chooseImg(type: .camera)
        }
        let twoAction = UIAlertAction(title: "从相册选择", style: .default) { (_) in
            self.chooseImg(type: .photoLibrary)
        }
        let threeAction = UIAlertAction(title: "取消", style: .cancel) { (_) in
            
        }
        alertController.addAction(oneAction)
        alertController.addAction(twoAction)
        alertController.addAction(threeAction)
        self.present(alertController, animated: true) {
        }
    }
    
    //从相册中选择
    func chooseImg(type:UIImagePickerController.SourceType){
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = false
        photoPicker.sourceType = type
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }

}

extension JCBindBankCardViewController :UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let type:String = info[UIImagePickerController.InfoKey.mediaType] as! String;
        if type == "public.image" {
            var resultImg = UIImage.init()
            resultImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage;
            let photoPath = JCOCTool.scaleImg(resultImg);
            picker.dismiss(animated: true, completion: {
                if self.cameraType == 0  {
                    self.photoPath1 = photoPath!;
                    self.mainView.idCardBtn.setBackgroundImage(UIImage.init(contentsOfFile: self.photoPath1), for: .normal)
                     self.mainView.idCardBtn.setTitle("", for: .normal)
                    self.mainView.idCardBtn.setImage(nil, for: .normal)

                } else if self.cameraType == 1 {
                    self.photoPath2 = photoPath!;
                    self.mainView.idCardBtn2.setBackgroundImage(UIImage.init(contentsOfFile: self.photoPath2), for: .normal)
                    self.mainView.idCardBtn2.setTitle("", for: .normal)
                    self.mainView.idCardBtn2.setImage(nil, for: .normal)
                }
            })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true) {
            
        };
    }
    
}





