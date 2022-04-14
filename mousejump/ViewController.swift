//
//  ViewController.swift
//  mousejump
//
//  Created by Josh Strange on 7/11/20.
//  Copyright © 2020 Josh Strange. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    lazy var window: NSWindow = self.view.window!
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { window.mouseLocationOutsideOfEventStream }
    override func viewDidLoad() {
        super.viewDidLoad()
//        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
//            print("mouseLocation:", String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y))
//            print("windowLocation:", String(format: "%.1f, %.1f", self.location.x, self.location.y))
//            return $0
//        }
		/**
		
		(0.0, 0.0, 2560.0, 1417.0) - Main - 478264490
		(-1440.0, -676.0, 1440.0, 2560.0) - Left - 478264483
		(307.0, 1440.0, 1920.0, 1080.0) - Top - 440984956
		(2560.0, -621.0, 1440.0, 2560.0) - Right - 478264489
		[0] - 478264490
		[1] - 478264483
		[2] - 440984956
		[3] - 478264489
		
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 478264490 - MAIN
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {2560, 1440}
		(0.0, 0.0, 2560.0, 1417.0)
		
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 478264483 - LEFT
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1440, 2560}
		(-1440.0, -676.0, 1440.0, 2560.0)
		
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1920, 1080}
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 440984956 - TOP
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		(307.0, 1440.0, 1920.0, 1080.0)
		
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1440, 2560}
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 478264489 - RIGHT
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		(2560.0, -621.0, 1440.0, 2560.0)
		
		
		// FLIPPED
		
		(0.0, 23.0, 2560.0, 1417.0)
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1440, 2560}
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 478264483
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		(-1440.0, -444.0, 1440.0, 2560.0)
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1920, 1080}
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 440984956
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		(307.0, -1080.0, 1920.0, 1080.0)
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceIsScreen) and value is - YES
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceSize) and value is - NSSize: {1440, 2560}
		key is - NSDeviceDescriptionKey(_rawValue: NSScreenNumber) and value is - 478264489
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceBitsPerSample) and value is - 8
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceResolution) and value is - NSSize: {72, 72}
		key is - NSDeviceDescriptionKey(_rawValue: NSDeviceColorSpaceName) and value is - NSCalibratedRGBColorSpace
		(2560.0, -499.0, 1440.0, 2560.0)

		*/
        NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { event in
			let warpLines: [Dictionary<String, Any>] = [
				[
					"name": "Right to top",
					"direction": "left",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 2560, y: -499),
						CGPoint.init(x: 2560, y: 0),
					],
					"out": [
						CGPoint.init(x: 2226, y: -262),
						CGPoint.init(x: 2226, y: 0),
					]
				],
				[
					"name": "Top to right",
					"direction": "right",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 2227, y: -262),
						CGPoint.init(x: 2227, y: 0),
					],
					"out": [
						CGPoint.init(x: 2560, y: -499),
						CGPoint.init(x: 2560, y: 0),
					]
				],
				[
					"name": "Left to top",
					"direction": "right",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 0, y: -444),
						CGPoint.init(x: 0, y: 0),
					],
					"out": [
						CGPoint.init(x: 307, y: -242),
						CGPoint.init(x: 307, y: 0),
					]
				],
				[
					"name": "Top to left",
					"direction": "left",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 307, y: -242),
						CGPoint.init(x: 307, y: 0)
					],
					"out": [
						CGPoint.init(x: 0, y: -444),
						CGPoint.init(x: 0, y: 0),
					]
				],
				[
					"name": "Left to middle",
					"direction": "right",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 0, y: 1440),
						CGPoint.init(x: 0, y: 2116),
					],
					"out": [
						CGPoint.init(x: 10, y: 1430),
						CGPoint.init(x: 10, y: 1430),
					]
				],
				[
					"name": "Right to middle",
					"direction": "left",
					"type": "vertical",
					"in": [
						CGPoint.init(x: 2560, y: 1440),
						CGPoint.init(x: 2560, y: 2116),
					],
					"out": [
						CGPoint.init(x: 2550, y: 1430),
						CGPoint.init(x: 2550, y: 1430),
					]
				],
				[
					"name": "Middle left to top",
					"direction": "up",
					"type": "horizontal",
					"in": [
						CGPoint.init(x: 0, y: 0),
						CGPoint.init(x: 307, y: 0),
					],
					"out": [
						CGPoint.init(x: 317, y: -10),
						CGPoint.init(x: 317, y: -10),
					]
				],
				[
					"name": "Middle right to top",
					"direction": "up",
					"type": "horizontal",
					"in": [
						CGPoint.init(x: 2227, y: 0),
						CGPoint.init(x: 2560, y: 0),
					],
					"out": [
						CGPoint.init(x: 2217, y: -10),
						CGPoint.init(x: 2217, y: -10),
					]
				],
			];
			
			if let point: CGPoint = self.getCgMouseLoc() {
				
				for i in warpLines {
					if(i["type"] as! String == "vertical") {
						let inKey = (i["in"] as! [CGPoint]);
						let inStart = inKey[0];
						let inEnd = inKey[1];
						if(inStart.x == point.x && inStart.y <= point.y && point.y <= inEnd.y) {
							print("WARP V");
							print(i["name"] as! String)
							let outKey = (i["out"] as! [CGPoint]);
							let outStart = outKey[0];
							let outEnd = outKey[1];
							let direction = i["direction"] as! String;
							let inPos = point.y / (inStart.y - inEnd.y);
							let outPos = (outStart.y - outEnd.y) * abs(inPos);
							if(direction == "left") {
								self.moveMouseTo(point: CGPoint.init(x: outStart.x - 10, y: outEnd.y + outPos))
							} else if(direction == "right") {
								print(outPos);
								// print(String(format: "Moving to: %f, %f", outStart.x + 10, outEnd.y + outPos))
								self.moveMouseTo(point: CGPoint.init(x: outStart.x + 10, y: outEnd.y + outPos))
							}
							
						}
					} else if(i["type"] as! String == "horizontal") {
						let inKey = (i["in"] as! [CGPoint]);
						let inStart = inKey[0];
						let inEnd = inKey[1];
						if(inStart.y == point.y && inStart.x <= point.x && point.x <= inEnd.x) {
							print("WARP H");
							print(i["name"] as! String)
							let outKey = (i["out"] as! [CGPoint]);
							let outStart = outKey[0];
							let outEnd = outKey[1];
							let direction = i["direction"] as! String;
							let inPos = point.x / (inStart.x - inEnd.x);
							let outPos = (outStart.x - outEnd.x) * abs(inPos);
							if(direction == "up") {
								self.moveMouseTo(point: CGPoint.init(x: outStart.x + outPos, y: outEnd.y - 10))
							} else if(direction == "down") {
								print("Not Supported");
							}
							
						}
					}
				}
				
				// print(String(format: "CG: %f (+%f), %f (+%f)", point.x, event.deltaX, point.y, event.deltaY));
			} else {
				print("No point")
			}
			
//			NSScreen.screens.forEach { screen in
//				for (key, value) in screen.deviceDescription {
//					print("key is - \(key) and value is - \(value)")
//				}
//				// print(screen.deviceDescription);
//				// print(screen.frame);
//				print(self.flip(frame: screen.visibleFrame));
//			};
        }
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        window.acceptsMouseMovedEvents = true
    }
	
	func flip(frame: NSRect) -> CGRect {
		var cloneFrame = frame;
		cloneFrame.origin.y = (NSScreen.screens.first?.frame.size.height ?? 0) - frame.size.height - frame.origin.y;
		return cloneFrame;
	}
	
	func moveMouseTo(point: CGPoint) {
		CGEvent(mouseEventSource: nil, mouseType: CGEventType.mouseMoved, mouseCursorPosition: point, mouseButton: CGMouseButton.left)?.post(tap: CGEventTapLocation.cghidEventTap)
	}
	
	func getScreenWithMouse() -> NSScreen? {
	  let mouseLocation = NSEvent.mouseLocation
	  let screens = NSScreen.screens
	  let screenWithMouse = (screens.first { NSMouseInRect(mouseLocation, $0.frame, false) })

	  return screenWithMouse
	}
	
	func printDisplays() {
        var displayCount: UInt32 = 0;
        var result = CGGetActiveDisplayList(0, nil, &displayCount)
            
        if result != .success {
            print("error: \(result)")
            return
        }

        let allocated = Int(displayCount)
        let activeDisplays = UnsafeMutablePointer<CGDirectDisplayID>.allocate(capacity: allocated)
        result = CGGetActiveDisplayList(displayCount, activeDisplays, &displayCount)
        if result != .success {
            print("error: \(result)")
            return
        }

        print("\(displayCount) displays:")
        for i in 0..<displayCount {
			print("[\(i)] - \(activeDisplays[Int(i)])")
        }
        activeDisplays.deallocate()
    }
	func getCgMouseLoc() -> CGPoint? {
	  let mouseLocEvent = CGEvent.init(source: nil)
		mouseLocEvent?.location.x.round();
		mouseLocEvent?.location.y.round();
	  return mouseLocEvent?.location
	}
}
