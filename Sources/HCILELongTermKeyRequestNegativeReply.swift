//
//  HCILELongTermKeyRequestNegativeReply.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension HCILowEnergyCommand {
    
    /// LE Long Term Key Request Negative Reply Command
    ///
    /// The command is used to reply to an LE Long Term Key Request event
    /// from the Controller if the Host cannot provide a Long Term Key for this Connection_Handle.
    public struct HCILELongTermKeyRequestNegativeReply: HCICommandParameter {
        
        public static let command = HCILowEnergyCommand.longTermKeyNegativeReply //0x001B
        
        /// Range 0x0000-0x0EFF (all other values reserved for future use)
        public let connectionHandle: UInt16 //Connection_Handle
        
        public init(connectionHandle: UInt16) {
            
            self.connectionHandle = connectionHandle
        }
        
        public var data: Data {
            
            let connectionHandleBytes = connectionHandle.littleEndian.bytes
            
            return Data([
                connectionHandleBytes.0,
                connectionHandleBytes.1
                ])
        }
    }
}
