//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 최승범 on 2023/09/14.
//

import UIKit

class FruitStoreViewController: UIViewController {
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        initStepper()
        
        
        
        
        print("화면 2 : \(fruitStore!.fruitList)")
    }
    
   
    @IBOutlet weak var storeStrawberryLabel: UILabel!
    
    @IBOutlet weak var storeBananaLabel: UILabel!
    
    @IBOutlet weak var storePineappleLabel: UILabel!
    
    @IBOutlet weak var storeKiwiLabel: UILabel!
    
    @IBOutlet weak var storeMangoLabel: UILabel!
    
    
    //MARK: - Stepper
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    @IBOutlet weak var bananaStepper: UIStepper!
    
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    @IBOutlet weak var kiwiStepper: UIStepper!
    
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func backToJuiceMakerView(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
 
    
    @IBAction func fruitStockStepper(_ sender: UIStepper) {
        do {
            guard let labelName = sender.accessibilityLabel else {
                print("labelName 바인딩 실패")
                return }

            guard let fruitStore = fruitStore else { return }
            
            guard let fruit = fruitStore.fruitList.filter({$0.name == labelName}).first else { return }
            
           
            
            try fruitStore.addFruitStock(inputFruit: fruit, count: Int(sender.value)) // n + 1
            
            updateUI()
        } catch {
            print("\(error)")
        }
    }
    
    
    private func initStepper() {
        strawberryStepper.accessibilityLabel = "딸기"
        strawberryStepper.value = Double(fruitStore?.fruitList[0].stock ?? 10 )
        
        bananaStepper.accessibilityLabel = "바나나"
        bananaStepper.value = Double(fruitStore?.fruitList[1].stock ?? 10 )
        
        pineappleStepper.accessibilityLabel = "파인애플"
        pineappleStepper.value = Double(fruitStore?.fruitList[2].stock ?? 10 )
        
        kiwiStepper.accessibilityLabel = "키위"
        kiwiStepper.value = Double(fruitStore?.fruitList[3].stock ?? 10 )
        
        mangoStepper.accessibilityLabel = "망고"
        mangoStepper.value = Double(fruitStore?.fruitList[4].stock ?? 10 )
    }
    
    
    
    
    
    
    private func updateUI() {
        guard let bindingFruitStore = fruitStore else { return }
        storeStrawberryLabel.text = String(bindingFruitStore.fruitList[0].stock)
        
        storeBananaLabel.text = String(bindingFruitStore.fruitList[1].stock)
        storePineappleLabel.text = String(bindingFruitStore.fruitList[2].stock)
        storeKiwiLabel.text = String(bindingFruitStore.fruitList[3].stock)
        storeMangoLabel.text = String(bindingFruitStore.fruitList[4].stock)
        
    }
}
