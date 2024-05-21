//
//  CalculatorViewController.swift
//  bmicalcurate
//
//  Created by 여누 on 5/22/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var heightField: UITextField!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var weightField: UITextField!
    
    @IBOutlet var randomCalculateButoon: UIButton!
    
    @IBOutlet var calculateButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "BMI Calculator"
        //titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.font = .systemFont(ofSize: 22, weight: .heavy , width: .standard)
        titleLabel.textAlignment = .left
        
        contentLabel.text = "당신의 BMI 지수를 \n알려드릴게요."
        contentLabel.font = .systemFont(ofSize: 15)
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        
        imageView.image = UIImage(named: "image")
        
        heightLabel.text = "키가 어떻게 되시나요?"
        heightLabel.font = .systemFont(ofSize: 15)
        heightLabel.textAlignment = .left
        
        heightField.keyboardType = .numberPad
        heightField.layer.borderWidth = 2
        heightField.layer.cornerRadius = 15
        
        weightLabel.text = "몸무게가 어떻게 되시나요?"
        weightLabel.font = .systemFont(ofSize: 15)
        weightLabel.textAlignment = .left
        
        weightField.keyboardType = .numberPad
        weightField.layer.borderWidth = 2
        weightField.layer.cornerRadius = 15
        
        randomCalculateButoon.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomCalculateButoon.setTitleColor(.red, for: .normal)
        
        calculateButton.setTitle("결과 확인", for: .normal)
        calculateButton.layer.cornerRadius = 15
        calculateButton.backgroundColor = .purple
        
       
        
    }

 
    @IBAction func ViewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func bmicalculateaTapped(_ sender: UIButton) {
        //heightField,weightField 입력값이 없을 때
        if heightField.text! == "" || weightField.text! == "" {
            let alert = UIAlertController(title: "입력 값을 넣어주세요",message: nil ,preferredStyle: .alert)
            
            //2.
            
            let close = UIAlertAction(title: "닫기", style: .cancel)
            
            //3. 버튼 합치기
            alert.addAction(close)
            
            //4.
            present(alert, animated : true)
        }else{
            let height = Double(heightField.text!)!
            let weight = Double(weightField.text!)!
            
            //입력값이 너무 클 때
            if height > 250.00 || weight > 150.00 {
                //1.
                //빈칸으로 넣으려면 nil
                let alert = UIAlertController(title:"입력값이 너무 큽니다." , message: nil, preferredStyle: .alert)
                
                //2.
                
                let close = UIAlertAction(title: "닫기", style: .cancel)
                
                //3. 버튼 합치기
                alert.addAction(close)
                
                //4.
                present(alert, animated : true)
            }else{
                let bmi = weight / (height * height * 0.0001)
                
                //1.
                //빈칸으로 넣으려면 nil
                let alert = UIAlertController(title: "BMI지수 : \(Int(bmi))", message: "키 : \(Int(height))   몸무게 : \(Int(weight))", preferredStyle: .alert)
                
                //2.
                
                let close = UIAlertAction(title: "닫기", style: .cancel)
                
                //3. 버튼 합치기
                alert.addAction(close)
                
                //4.
                present(alert, animated : true)
            }
        }
    }
    
    @IBAction func randomCalculateClicked(_ sender: UIButton) {
        let height:Double = Double.random(in: 100...250)
        let weight:Double = Double.random(in: 100...250)
        
        let bmi = weight / (height * height * 0.0001)
        //1.
        //빈칸으로 넣으려면 nil
        let alert = UIAlertController(title: "BMI지수 : \(Int(bmi))", message: "키 : \(Int(height))   몸무게 : \(Int(weight))", preferredStyle: .alert)
        
        //2.

        let close = UIAlertAction(title: "닫기", style: .cancel)
        
        //3. 버튼 합치기
        alert.addAction(close)
        
        //4.
        present(alert, animated : true)
    }
    

}
