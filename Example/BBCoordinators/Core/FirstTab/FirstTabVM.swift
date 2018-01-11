//
//  FirstTabVM.swift
//  TestProject
//
//  Created by David Lenský on 26/11/2017.
//  Copyright © 2017 David Lenský. All rights reserved.
//

import UIKit //TODO - this is shit... Fix it!

class FirstTabVM: BaseViewModel {
    
    func switchValueChanged() {
		(UIApplication.shared.delegate as! AppDelegate).switchStacks()
    }
    
}
