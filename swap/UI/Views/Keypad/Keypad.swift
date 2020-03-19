//
//  Keypad.swift
//  swap
//
//  Created by Maximilian Hvesser-Lewis on 16/03/2020.
//  Copyright © 2020 Hvesser. All rights reserved.
//

import SwiftUI

struct Keypad: View {
    @ObservedObject var keypadController: KeypadController
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    HStack {
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Seven.rawValue)
                        }) {
                            Text("7")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Eight.rawValue)
                        }) {
                            Text("8")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Nine.rawValue)
                        }) {
                            Text("9")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                    }
                }
                VStack {
                    HStack {
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Four.rawValue)
                        }) {
                            Text("4")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Five.rawValue)
                        }) {
                            Text("5")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Six.rawValue)
                        }) {
                            Text("6")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                    }
                }
                VStack {
                    HStack {
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.One.rawValue)
                        }) {
                            Text("1")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Two.rawValue)
                        }) {
                            Text("2")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Three.rawValue)
                        }) {
                            Text("3")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                    }
                }
                VStack {
                    HStack {
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Decimal.rawValue)
                        }) {
                            Text(".")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Zero.rawValue)
                        }) {
                            Text("0")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                        Button(action:{
                            self.publishKeyValue(val: KeypadKey.Backspace.rawValue)
                        }) {
                            Text("-")
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 3, height: geometry.size.height / 4)
                        }
                    }
                }
            }
        }
    }
    
    private func publishKeyValue(val value: Int) {
        keypadController.selectedKey = value
    }
    
}

struct Keypad_Previews: PreviewProvider {
    static var previews: some View {
        Keypad(keypadController: KeypadController())
            .background(Color.backgroundPrimary)
            .edgesIgnoringSafeArea(.all)
    }
}
