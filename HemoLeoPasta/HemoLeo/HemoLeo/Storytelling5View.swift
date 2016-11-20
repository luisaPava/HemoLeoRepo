//
// Storytelling5View.swift
// Generated by Core Animator version 1.3.2 on 17/11/16.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class Storytelling5PassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class Storytelling5View : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:1024, height:768)
		__scaling__.center = CGPoint(x:512.0, y:384.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let fala9__root = Storytelling5PassthroughView()
		let fala9__xScale = Storytelling5PassthroughView()
		let fala9__yScale = Storytelling5PassthroughView()
		let fala9 = UIImageView()
		let imgFala7 = UIImage(named:"Fala9.png", in: bundle, compatibleWith: nil)
		if imgFala7 == nil {
			print("** Warning: Could not create image from 'Fala9.png'")
		}
		fala9.image = imgFala7
		fala9.contentMode = .center
		fala9.bounds = CGRect(x:0, y:0, width:803.0, height:254.0)
		fala9__root.layer.position = CGPoint(x:579.169, y:199.996)
		fala9__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala9__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala9__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(fala9__root)
		fala9__root.addSubview(fala9__xScale)
		fala9__xScale.addSubview(fala9__yScale)
		fala9__yScale.addSubview(fala9)
		__scaling__.addSubview(fala9__root)
		viewsByName["Fala9__root"] = fala9__root
		viewsByName["Fala9__xScale"] = fala9__xScale
		viewsByName["Fala9__yScale"] = fala9__yScale
		viewsByName["Fala9"] = fala9

		let fala9Mask__root = Storytelling5PassthroughView()
		let fala9Mask__xScale = Storytelling5PassthroughView()
		let fala9Mask__yScale = Storytelling5PassthroughView()
		let fala9Mask = UIImageView()
		let imgGradient2 = UIImage(named:"gradient2.png", in: bundle, compatibleWith: nil)
		if imgGradient2 == nil {
			print("** Warning: Could not create image from 'gradient2.png'")
		}
		fala9Mask.image = imgGradient2
		fala9Mask.contentMode = .center
		fala9Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		fala9Mask__root.layer.position = CGPoint(x:-747.000, y:114.637)
		fala9Mask__xScale.transform = CGAffineTransform(scaleX: 1.66, y: 1.00)
		fala9Mask__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 12.95)
		fala9Mask__root.transform = CGAffineTransform(rotationAngle: 4.712)
		fala9.addSubview(fala9Mask__root)
		fala9Mask__root.addSubview(fala9Mask__xScale)
		fala9Mask__xScale.addSubview(fala9Mask__yScale)
		fala9Mask__yScale.addSubview(fala9Mask)
		fala9.mask = fala9Mask__root
		viewsByName["Fala9_mask__root"] = fala9Mask__root
		viewsByName["Fala9_mask__xScale"] = fala9Mask__xScale
		viewsByName["Fala9_mask__yScale"] = fala9Mask__yScale
		viewsByName["Fala9_mask"] = fala9Mask

		let fala8__root = Storytelling5PassthroughView()
		let fala8__xScale = Storytelling5PassthroughView()
		let fala8__yScale = Storytelling5PassthroughView()
		let fala8 = UIImageView()
		let imgFala6 = UIImage(named:"Fala8.png", in: bundle, compatibleWith: nil)
		if imgFala6 == nil {
			print("** Warning: Could not create image from 'Fala8.png'")
		}
		fala8.image = imgFala6
		fala8.contentMode = .center
		fala8.bounds = CGRect(x:0, y:0, width:803.0, height:172.0)
		fala8__root.layer.position = CGPoint(x:579.253, y:157.878)
		fala8__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala8__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala8__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(fala8__root)
		fala8__root.addSubview(fala8__xScale)
		fala8__xScale.addSubview(fala8__yScale)
		fala8__yScale.addSubview(fala8)
		__scaling__.addSubview(fala8__root)
		viewsByName["Fala8__root"] = fala8__root
		viewsByName["Fala8__xScale"] = fala8__xScale
		viewsByName["Fala8__yScale"] = fala8__yScale
		viewsByName["Fala8"] = fala8

		let fala8Mask__root = Storytelling5PassthroughView()
		let fala8Mask__xScale = Storytelling5PassthroughView()
		let fala8Mask__yScale = Storytelling5PassthroughView()
		let fala8Mask = UIImageView()
		fala8Mask.image = imgGradient2
		fala8Mask.contentMode = .center
		fala8Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		fala8Mask__root.layer.position = CGPoint(x:-724.000, y:87.490)
		fala8Mask__xScale.transform = CGAffineTransform(scaleX: 1.46, y: 1.00)
		fala8Mask__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 12.43)
		fala8Mask__root.transform = CGAffineTransform(rotationAngle: 4.717)
		fala8.addSubview(fala8Mask__root)
		fala8Mask__root.addSubview(fala8Mask__xScale)
		fala8Mask__xScale.addSubview(fala8Mask__yScale)
		fala8Mask__yScale.addSubview(fala8Mask)
		fala8.mask = fala8Mask__root
		viewsByName["Fala8_mask__root"] = fala8Mask__root
		viewsByName["Fala8_mask__xScale"] = fala8Mask__xScale
		viewsByName["Fala8_mask__yScale"] = fala8Mask__yScale
		viewsByName["Fala8_mask"] = fala8Mask

		let leoFalando__root = Storytelling5PassthroughView()
		let leoFalando__xScale = Storytelling5PassthroughView()
		let leoFalando__yScale = Storytelling5PassthroughView()
		let leoFalando = UIImageView()
		let imgLeoFalando = UIImage(named:"Leo falando.png", in: bundle, compatibleWith: nil)
		if imgLeoFalando == nil {
			print("** Warning: Could not create image from 'Leo falando.png'")
		}
		leoFalando.image = imgLeoFalando
		leoFalando.contentMode = .center
		leoFalando.bounds = CGRect(x:0, y:0, width:258.0, height:300.0)
		leoFalando__root.layer.position = CGPoint(x:115.000, y:130.000)
		leoFalando__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		leoFalando__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		leoFalando__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(leoFalando__root)
		leoFalando__root.addSubview(leoFalando__xScale)
		leoFalando__xScale.addSubview(leoFalando__yScale)
		leoFalando__yScale.addSubview(leoFalando)
		__scaling__.addSubview(leoFalando__root)
		viewsByName["Leo falando__root"] = leoFalando__root
		viewsByName["Leo falando__xScale"] = leoFalando__xScale
		viewsByName["Leo falando__yScale"] = leoFalando__yScale
		viewsByName["Leo falando"] = leoFalando

		let movement__root = Storytelling5PassthroughView()
		let movement__xScale = Storytelling5PassthroughView()
		let movement__yScale = Storytelling5PassthroughView()
		let movement = UIImageView()
		let imgArrow = UIImage(named:"arrow.png", in: bundle, compatibleWith: nil)
		if imgArrow == nil {
			print("** Warning: Could not create image from 'arrow.png'")
		}
		movement.image = imgArrow
		movement.contentMode = .center
		movement.bounds = CGRect(x:0, y:0, width:56.0, height:16.0)
		movement__root.layer.position = CGPoint(x:908.000, y:708.000)
		movement__xScale.transform = CGAffineTransform(scaleX: 1.40, y: 1.00)
		movement__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.40)
		movement__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(movement__root)
		movement__root.addSubview(movement__xScale)
		movement__xScale.addSubview(movement__yScale)
		movement__yScale.addSubview(movement)
		__scaling__.addSubview(movement__root)
		viewsByName["Movement__root"] = movement__root
		viewsByName["Movement__xScale"] = movement__xScale
		viewsByName["Movement__yScale"] = movement__yScale
		viewsByName["Movement"] = movement

		let movementMask__root = Storytelling5PassthroughView()
		let movementMask__xScale = Storytelling5PassthroughView()
		let movementMask__yScale = Storytelling5PassthroughView()
		let movementMask = UIImageView()
		movementMask.image = imgGradient2
		movementMask.contentMode = .center
		movementMask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		movementMask__root.layer.position = CGPoint(x:136.000, y:5.000)
		movementMask__xScale.transform = CGAffineTransform(scaleX: 0.17, y: 1.00)
		movementMask__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.06)
		movementMask__root.transform = CGAffineTransform(rotationAngle: 4.712)
		movement.addSubview(movementMask__root)
		movementMask__root.addSubview(movementMask__xScale)
		movementMask__xScale.addSubview(movementMask__yScale)
		movementMask__yScale.addSubview(movementMask)
		movement.mask = movementMask__root
		viewsByName["Movement_mask__root"] = movementMask__root
		viewsByName["Movement_mask__xScale"] = movementMask__xScale
		viewsByName["Movement_mask__yScale"] = movementMask__yScale
		viewsByName["Movement_mask"] = movementMask

		let hand__root = Storytelling5PassthroughView()
		let hand__xScale = Storytelling5PassthroughView()
		let hand__yScale = Storytelling5PassthroughView()
		let hand = UIImageView()
		let imgHand = UIImage(named:"hand.png", in: bundle, compatibleWith: nil)
		if imgHand == nil {
			print("** Warning: Could not create image from 'hand.png'")
		}
		hand.image = imgHand
		hand.contentMode = .center
		hand.bounds = CGRect(x:0, y:0, width:54.0, height:50.0)
		hand__root.layer.position = CGPoint(x:958.925, y:728.962)
		hand__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		hand__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		hand__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(hand__root)
		hand__root.addSubview(hand__xScale)
		hand__xScale.addSubview(hand__yScale)
		hand__yScale.addSubview(hand)
		__scaling__.addSubview(hand__root)
		viewsByName["hand__root"] = hand__root
		viewsByName["hand__xScale"] = hand__xScale
		viewsByName["hand__yScale"] = hand__yScale
		viewsByName["hand"] = hand

		let leo__root = Storytelling5PassthroughView()
		let leo__xScale = Storytelling5PassthroughView()
		let leo__yScale = Storytelling5PassthroughView()
		let leo = UIView()
		leo.bounds = CGRect(x:0, y:0, width:297.2, height:352.4)
		leo__root.layer.position = CGPoint(x:512.000, y:536.244)
		leo__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		leo__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		leo__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(leo__root)
		leo__root.addSubview(leo__xScale)
		leo__xScale.addSubview(leo__yScale)
		leo__yScale.addSubview(leo)
		__scaling__.addSubview(leo__root)
		viewsByName["Leo__root"] = leo__root
		viewsByName["Leo__xScale"] = leo__xScale
		viewsByName["Leo__yScale"] = leo__yScale
		viewsByName["Leo"] = leo

		let leoMachucado__root = Storytelling5PassthroughView()
		let leoMachucado__xScale = Storytelling5PassthroughView()
		let leoMachucado__yScale = Storytelling5PassthroughView()
		let leoMachucado = UIImageView()
		let imgLeoMachucado = UIImage(named:"Leo machucado.png", in: bundle, compatibleWith: nil)
		if imgLeoMachucado == nil {
			print("** Warning: Could not create image from 'Leo machucado.png'")
		}
		leoMachucado.image = imgLeoMachucado
		leoMachucado.contentMode = .center
		leoMachucado.bounds = CGRect(x:0, y:0, width:452.0, height:536.0)
		leoMachucado__root.layer.position = CGPoint(x:148.598, y:176.214)
		leoMachucado__xScale.transform = CGAffineTransform(scaleX: 0.66, y: 1.00)
		leoMachucado__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.66)
		leoMachucado__root.transform = CGAffineTransform(rotationAngle: 0.000)
		leo.addSubview(leoMachucado__root)
		leoMachucado__root.addSubview(leoMachucado__xScale)
		leoMachucado__xScale.addSubview(leoMachucado__yScale)
		leoMachucado__yScale.addSubview(leoMachucado)
		leo.addSubview(leoMachucado__root)
		viewsByName["Leo machucado__root"] = leoMachucado__root
		viewsByName["Leo machucado__xScale"] = leoMachucado__xScale
		viewsByName["Leo machucado__yScale"] = leoMachucado__yScale
		viewsByName["Leo machucado"] = leoMachucado

		let machucado__root = Storytelling5PassthroughView()
		let machucado__xScale = Storytelling5PassthroughView()
		let machucado__yScale = Storytelling5PassthroughView()
		let machucado = UIImageView()
		let imgMachucado = UIImage(named:"Machucado.png", in: bundle, compatibleWith: nil)
		if imgMachucado == nil {
			print("** Warning: Could not create image from 'Machucado.png'")
		}
		machucado.image = imgMachucado
		machucado.contentMode = .center
		machucado.bounds = CGRect(x:0, y:0, width:14.0, height:21.0)
		machucado__root.layer.position = CGPoint(x:73.348, y:228.464)
		machucado__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		machucado__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		machucado__root.transform = CGAffineTransform(rotationAngle: 0.000)
		leo.addSubview(machucado__root)
		machucado__root.addSubview(machucado__xScale)
		machucado__xScale.addSubview(machucado__yScale)
		machucado__yScale.addSubview(machucado)
		leo.addSubview(machucado__root)
		viewsByName["Machucado__root"] = machucado__root
		viewsByName["Machucado__xScale"] = machucado__xScale
		viewsByName["Machucado__yScale"] = machucado__yScale
		viewsByName["Machucado"] = machucado

		let roxoPata2__root = Storytelling5PassthroughView()
		let roxoPata2__xScale = Storytelling5PassthroughView()
		let roxoPata2__yScale = Storytelling5PassthroughView()
		let roxoPata2 = UIImageView()
		let imgRoxoPata2 = UIImage(named:"Roxo pata2.png", in: bundle, compatibleWith: nil)
		if imgRoxoPata2 == nil {
			print("** Warning: Could not create image from 'Roxo pata2.png'")
		}
		roxoPata2.image = imgRoxoPata2
		roxoPata2.contentMode = .center
		roxoPata2.bounds = CGRect(x:0, y:0, width:15.0, height:21.0)
		roxoPata2__root.layer.position = CGPoint(x:515.750, y:631.592)
		roxoPata2__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoPata2__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoPata2__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(roxoPata2__root)
		roxoPata2__root.addSubview(roxoPata2__xScale)
		roxoPata2__xScale.addSubview(roxoPata2__yScale)
		roxoPata2__yScale.addSubview(roxoPata2)
		__scaling__.addSubview(roxoPata2__root)
		viewsByName["Roxo pata2__root"] = roxoPata2__root
		viewsByName["Roxo pata2__xScale"] = roxoPata2__xScale
		viewsByName["Roxo pata2__yScale"] = roxoPata2__yScale
		viewsByName["Roxo pata2"] = roxoPata2

		let roxoPata__root = Storytelling5PassthroughView()
		let roxoPata__xScale = Storytelling5PassthroughView()
		let roxoPata__yScale = Storytelling5PassthroughView()
		let roxoPata = UIImageView()
		let imgRoxoPata = UIImage(named:"Roxo pata.png", in: bundle, compatibleWith: nil)
		if imgRoxoPata == nil {
			print("** Warning: Could not create image from 'Roxo pata.png'")
		}
		roxoPata.image = imgRoxoPata
		roxoPata.contentMode = .center
		roxoPata.bounds = CGRect(x:0, y:0, width:11.0, height:17.0)
		roxoPata__root.layer.position = CGPoint(x:486.967, y:666.623)
		roxoPata__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoPata__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoPata__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(roxoPata__root)
		roxoPata__root.addSubview(roxoPata__xScale)
		roxoPata__xScale.addSubview(roxoPata__yScale)
		roxoPata__yScale.addSubview(roxoPata)
		__scaling__.addSubview(roxoPata__root)
		viewsByName["Roxo pata__root"] = roxoPata__root
		viewsByName["Roxo pata__xScale"] = roxoPata__xScale
		viewsByName["Roxo pata__yScale"] = roxoPata__yScale
		viewsByName["Roxo pata"] = roxoPata

		let roxoCostas__root = Storytelling5PassthroughView()
		let roxoCostas__xScale = Storytelling5PassthroughView()
		let roxoCostas__yScale = Storytelling5PassthroughView()
		let roxoCostas = UIImageView()
		let imgRoxoCostas = UIImage(named:"Roxo costas.png", in: bundle, compatibleWith: nil)
		if imgRoxoCostas == nil {
			print("** Warning: Could not create image from 'Roxo costas.png'")
		}
		roxoCostas.image = imgRoxoCostas
		roxoCostas.contentMode = .center
		roxoCostas.bounds = CGRect(x:0, y:0, width:32.0, height:16.0)
		roxoCostas__root.layer.position = CGPoint(x:468.264, y:543.174)
		roxoCostas__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoCostas__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		roxoCostas__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(roxoCostas__root)
		roxoCostas__root.addSubview(roxoCostas__xScale)
		roxoCostas__xScale.addSubview(roxoCostas__yScale)
		roxoCostas__yScale.addSubview(roxoCostas)
		__scaling__.addSubview(roxoCostas__root)
		viewsByName["Roxo costas__root"] = roxoCostas__root
		viewsByName["Roxo costas__xScale"] = roxoCostas__xScale
		viewsByName["Roxo costas__yScale"] = roxoCostas__yScale
		viewsByName["Roxo costas"] = roxoCostas

		let machucadoCabeça__root = Storytelling5PassthroughView()
		let machucadoCabeça__xScale = Storytelling5PassthroughView()
		let machucadoCabeça__yScale = Storytelling5PassthroughView()
		let machucadoCabeça = UIImageView()
		let imgMachucadoCabeça = UIImage(named:"Machucado cabeça.png", in: bundle, compatibleWith: nil)
		if imgMachucadoCabeça == nil {
			print("** Warning: Could not create image from 'Machucado cabeça.png'")
		}
		machucadoCabeça.image = imgMachucadoCabeça
		machucadoCabeça.contentMode = .center
		machucadoCabeça.bounds = CGRect(x:0, y:0, width:34.0, height:33.0)
		machucadoCabeça__root.layer.position = CGPoint(x:529.000, y:441.005)
		machucadoCabeça__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		machucadoCabeça__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		machucadoCabeça__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(machucadoCabeça__root)
		machucadoCabeça__root.addSubview(machucadoCabeça__xScale)
		machucadoCabeça__xScale.addSubview(machucadoCabeça__yScale)
		machucadoCabeça__yScale.addSubview(machucadoCabeça)
		__scaling__.addSubview(machucadoCabeça__root)
		viewsByName["Machucado cabeça__root"] = machucadoCabeça__root
		viewsByName["Machucado cabeça__xScale"] = machucadoCabeça__xScale
		viewsByName["Machucado cabeça__yScale"] = machucadoCabeça__yScale
		viewsByName["Machucado cabeça"] = machucadoCabeça

		let icepack__root = Storytelling5PassthroughView()
		let icepack__xScale = Storytelling5PassthroughView()
		let icepack__yScale = Storytelling5PassthroughView()
		let icepack = UIImageView()
		let imgIcepack = UIImage(named:"Icepack.png", in: bundle, compatibleWith: nil)
		if imgIcepack == nil {
			print("** Warning: Could not create image from 'Icepack.png'")
		}
		icepack.image = imgIcepack
		icepack.contentMode = .center
		icepack.bounds = CGRect(x:0, y:0, width:107.0, height:74.0)
		icepack__root.layer.position = CGPoint(x:292.461, y:387.424)
		icepack__root.alpha = 0.00
		icepack__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		icepack__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		icepack__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(icepack__root)
		icepack__root.addSubview(icepack__xScale)
		icepack__xScale.addSubview(icepack__yScale)
		icepack__yScale.addSubview(icepack)
		__scaling__.addSubview(icepack__root)
		viewsByName["Icepack__root"] = icepack__root
		viewsByName["Icepack__xScale"] = icepack__xScale
		viewsByName["Icepack__yScale"] = icepack__yScale
		viewsByName["Icepack"] = icepack

		self.viewsByName = viewsByName
	}

	// - MARK: story4

	func addStory4Animation() {
		addStory4Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addStory4Animation(completion: ((Bool) -> Void)?) {
		addStory4Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addStory4Animation(removedOnCompletion: Bool) {
		addStory4Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addStory4Animation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addStory4Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addStory4Animation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 13.400
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Story4")
			self.animationCompletions[layer.animation(forKey: "Story4")!] = complete
		}

		let fala8MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fala8MaskTranslationXAnimation.duration = 13.400
		fala8MaskTranslationXAnimation.values = [0.000, 0.000, 1450.000, 1450.000, 0.000, 0.000] as [Float]
		fala8MaskTranslationXAnimation.keyTimes = [0.000, 0.030, 0.060, 0.597, 0.638, 1.000] as [NSNumber]
		fala8MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		fala8MaskTranslationXAnimation.beginTime = beginTime
		fala8MaskTranslationXAnimation.fillMode = fillMode
		fala8MaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala8_mask__root"]?.layer.add(fala8MaskTranslationXAnimation, forKey:"story4_TranslationX")

		let fala8MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fala8MaskTranslationYAnimation.duration = 13.400
		fala8MaskTranslationYAnimation.values = [0.000, 0.000, 0.000, 0.000] as [Float]
		fala8MaskTranslationYAnimation.keyTimes = [0.000, 0.030, 0.597, 1.000] as [NSNumber]
		fala8MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fala8MaskTranslationYAnimation.beginTime = beginTime
		fala8MaskTranslationYAnimation.fillMode = fillMode
		fala8MaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala8_mask__root"]?.layer.add(fala8MaskTranslationYAnimation, forKey:"story4_TranslationY")

		let leoMachucadoImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
		leoMachucadoImageContentsAnimation.duration = 13.400
		leoMachucadoImageContentsAnimation.values = [UIImage(named: "Leo machucado.png")!.cgImage!, UIImage(named: "Leo machucado.png")!.cgImage!, UIImage(named: "Leo sorrindo.png")!.cgImage!, UIImage(named: "Leo sorrindo.png")!.cgImage!, UIImage(named: "Leo sorrindo.png")!.cgImage!] as [CGImage]
		leoMachucadoImageContentsAnimation.keyTimes = [0.000, 0.957, 0.957, 1.000, 1.000] as [NSNumber]
		leoMachucadoImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming]
		leoMachucadoImageContentsAnimation.beginTime = beginTime
		leoMachucadoImageContentsAnimation.fillMode = fillMode
		leoMachucadoImageContentsAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Leo machucado"]?.layer.add(leoMachucadoImageContentsAnimation, forKey:"story4_ImageContents")

		let leoFalandoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		leoFalandoScaleXAnimation.duration = 13.400
		leoFalandoScaleXAnimation.values = [0.000, 0.800, 0.700, 0.700] as [Float]
		leoFalandoScaleXAnimation.keyTimes = [0.000, 0.022, 0.030, 1.000] as [NSNumber]
		leoFalandoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleXAnimation.beginTime = beginTime
		leoFalandoScaleXAnimation.fillMode = fillMode
		leoFalandoScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando__xScale"]?.layer.add(leoFalandoScaleXAnimation, forKey:"story4_ScaleX")

		let leoFalandoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		leoFalandoScaleYAnimation.duration = 13.400
		leoFalandoScaleYAnimation.values = [0.000, 0.800, 0.700, 0.700] as [Float]
		leoFalandoScaleYAnimation.keyTimes = [0.000, 0.022, 0.030, 1.000] as [NSNumber]
		leoFalandoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleYAnimation.beginTime = beginTime
		leoFalandoScaleYAnimation.fillMode = fillMode
		leoFalandoScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando__yScale"]?.layer.add(leoFalandoScaleYAnimation, forKey:"story4_ScaleY")

		let roxoPata2OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoPata2OpacityAnimation.duration = 13.400
		roxoPata2OpacityAnimation.values = [1.000, 1.000, 0.000, 0.000] as [Float]
		roxoPata2OpacityAnimation.keyTimes = [0.000, 0.802, 0.821, 1.000] as [NSNumber]
		roxoPata2OpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoPata2OpacityAnimation.beginTime = beginTime
		roxoPata2OpacityAnimation.fillMode = fillMode
		roxoPata2OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo pata2__root"]?.layer.add(roxoPata2OpacityAnimation, forKey:"story4_Opacity")

		let machucadoCabeçaScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		machucadoCabeçaScaleXAnimation.duration = 13.400
		machucadoCabeçaScaleXAnimation.values = [0.000, 0.000, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 0.900, 0.900, 1.000, 1.000, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 1.000, 0.000, 0.000] as [Float]
		machucadoCabeçaScaleXAnimation.keyTimes = [0.000, 0.060, 0.084, 0.108, 0.131, 0.153, 0.177, 0.200, 0.200, 0.200, 0.224, 0.224, 0.224, 0.248, 0.271, 0.293, 0.317, 0.341, 0.364, 0.386, 0.410, 0.435, 0.457, 0.479, 0.504, 0.528, 0.550, 0.573, 0.597, 0.929, 0.957, 1.000] as [NSNumber]
		machucadoCabeçaScaleXAnimation.timingFunctions = [linearTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming]
		machucadoCabeçaScaleXAnimation.beginTime = beginTime
		machucadoCabeçaScaleXAnimation.fillMode = fillMode
		machucadoCabeçaScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Machucado cabeça__xScale"]?.layer.add(machucadoCabeçaScaleXAnimation, forKey:"story4_ScaleX")

		let machucadoCabeçaScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		machucadoCabeçaScaleYAnimation.duration = 13.400
		machucadoCabeçaScaleYAnimation.values = [0.000, 0.000, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 0.900, 1.000, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 0.900, 1.000, 1.000, 0.000, 0.000] as [Float]
		machucadoCabeçaScaleYAnimation.keyTimes = [0.000, 0.060, 0.084, 0.108, 0.131, 0.153, 0.177, 0.200, 0.200, 0.224, 0.224, 0.248, 0.271, 0.293, 0.317, 0.341, 0.364, 0.386, 0.410, 0.435, 0.457, 0.479, 0.504, 0.528, 0.550, 0.573, 0.597, 0.929, 0.957, 1.000] as [NSNumber]
		machucadoCabeçaScaleYAnimation.timingFunctions = [linearTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming, linearTiming, linearTiming]
		machucadoCabeçaScaleYAnimation.beginTime = beginTime
		machucadoCabeçaScaleYAnimation.fillMode = fillMode
		machucadoCabeçaScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Machucado cabeça__yScale"]?.layer.add(machucadoCabeçaScaleYAnimation, forKey:"story4_ScaleY")

		let roxoPataOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoPataOpacityAnimation.duration = 13.400
		roxoPataOpacityAnimation.values = [1.000, 1.000, 0.000, 0.000] as [Float]
		roxoPataOpacityAnimation.keyTimes = [0.000, 0.858, 0.877, 1.000] as [NSNumber]
		roxoPataOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoPataOpacityAnimation.beginTime = beginTime
		roxoPataOpacityAnimation.fillMode = fillMode
		roxoPataOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo pata__root"]?.layer.add(roxoPataOpacityAnimation, forKey:"story4_Opacity")

		let machucadoImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
		machucadoImageContentsAnimation.duration = 13.400
		machucadoImageContentsAnimation.values = [UIImage(named: "Machucado.png")!.cgImage!, UIImage(named: "Machucado.png")!.cgImage!, UIImage(named: "Machucado bom.png")!.cgImage!, UIImage(named: "Machucado bom.png")!.cgImage!, UIImage(named: "Machucado bom.png")!.cgImage!] as [CGImage]
		machucadoImageContentsAnimation.keyTimes = [0.000, 0.907, 0.907, 1.000, 1.000] as [NSNumber]
		machucadoImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming]
		machucadoImageContentsAnimation.beginTime = beginTime
		machucadoImageContentsAnimation.fillMode = fillMode
		machucadoImageContentsAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Machucado"]?.layer.add(machucadoImageContentsAnimation, forKey:"story4_ImageContents")

		let fala9MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fala9MaskTranslationXAnimation.duration = 13.400
		fala9MaskTranslationXAnimation.values = [0.000, 0.000, 1500.000, 1500.000] as [Float]
		fala9MaskTranslationXAnimation.keyTimes = [0.000, 0.642, 0.679, 1.000] as [NSNumber]
		fala9MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fala9MaskTranslationXAnimation.beginTime = beginTime
		fala9MaskTranslationXAnimation.fillMode = fillMode
		fala9MaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala9_mask__root"]?.layer.add(fala9MaskTranslationXAnimation, forKey:"story4_TranslationX")

		let fala9MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fala9MaskTranslationYAnimation.duration = 13.400
		fala9MaskTranslationYAnimation.values = [0.000, 0.000, 0.000] as [Float]
		fala9MaskTranslationYAnimation.keyTimes = [0.000, 0.642, 1.000] as [NSNumber]
		fala9MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		fala9MaskTranslationYAnimation.beginTime = beginTime
		fala9MaskTranslationYAnimation.fillMode = fillMode
		fala9MaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala9_mask__root"]?.layer.add(fala9MaskTranslationYAnimation, forKey:"story4_TranslationY")

		let icepackOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		icepackOpacityAnimation.duration = 13.400
		icepackOpacityAnimation.values = [0.000, 0.000, 1.000, 1.000] as [Float]
		icepackOpacityAnimation.keyTimes = [0.000, 0.679, 0.703, 1.000] as [NSNumber]
		icepackOpacityAnimation.timingFunctions = [anticOverTiming, linearTiming, linearTiming]
		icepackOpacityAnimation.beginTime = beginTime
		icepackOpacityAnimation.fillMode = fillMode
		icepackOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Icepack__root"]?.layer.add(icepackOpacityAnimation, forKey:"story4_Opacity")

		let icepackTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		icepackTranslationXAnimation.duration = 13.400
		icepackTranslationXAnimation.values = [0.000, 0.000, 179.073, 179.073, 228.396, 228.396, 192.505, 192.505, 145.242, 145.242, 548.414] as [Float]
		icepackTranslationXAnimation.keyTimes = [0.000, 0.709, 0.746, 0.767, 0.802, 0.821, 0.858, 0.877, 0.907, 0.957, 1.000] as [NSNumber]
		icepackTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		icepackTranslationXAnimation.beginTime = beginTime
		icepackTranslationXAnimation.fillMode = fillMode
		icepackTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Icepack__root"]?.layer.add(icepackTranslationXAnimation, forKey:"story4_TranslationX")

		let icepackTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		icepackTranslationYAnimation.duration = 13.400
		icepackTranslationYAnimation.values = [0.000, 0.000, 146.690, 146.690, 234.136, 234.136, 268.654, 268.654, 201.511, 201.511, 30.721] as [Float]
		icepackTranslationYAnimation.keyTimes = [0.000, 0.709, 0.746, 0.767, 0.802, 0.821, 0.858, 0.877, 0.907, 0.957, 1.000] as [NSNumber]
		icepackTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		icepackTranslationYAnimation.beginTime = beginTime
		icepackTranslationYAnimation.fillMode = fillMode
		icepackTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Icepack__root"]?.layer.add(icepackTranslationYAnimation, forKey:"story4_TranslationY")

		let roxoCostasOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoCostasOpacityAnimation.duration = 13.400
		roxoCostasOpacityAnimation.values = [1.000, 1.000, 0.000, 0.000] as [Float]
		roxoCostasOpacityAnimation.keyTimes = [0.000, 0.746, 0.767, 1.000] as [NSNumber]
		roxoCostasOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoCostasOpacityAnimation.beginTime = beginTime
		roxoCostasOpacityAnimation.fillMode = fillMode
		roxoCostasOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo costas__root"]?.layer.add(roxoCostasOpacityAnimation, forKey:"story4_Opacity")
	}

	func removeStory4Animation() {
		self.layer.removeAnimation(forKey: "Story4")
		self.viewsByName["Fala8_mask__root"]?.layer.removeAnimation(forKey: "story4_TranslationX")
		self.viewsByName["Fala8_mask__root"]?.layer.removeAnimation(forKey: "story4_TranslationY")
		self.viewsByName["Leo machucado"]?.layer.removeAnimation(forKey: "story4_ImageContents")
		self.viewsByName["Leo falando__xScale"]?.layer.removeAnimation(forKey: "story4_ScaleX")
		self.viewsByName["Leo falando__yScale"]?.layer.removeAnimation(forKey: "story4_ScaleY")
		self.viewsByName["Roxo pata2__root"]?.layer.removeAnimation(forKey: "story4_Opacity")
		self.viewsByName["Machucado cabeça__xScale"]?.layer.removeAnimation(forKey: "story4_ScaleX")
		self.viewsByName["Machucado cabeça__yScale"]?.layer.removeAnimation(forKey: "story4_ScaleY")
		self.viewsByName["Roxo pata__root"]?.layer.removeAnimation(forKey: "story4_Opacity")
		self.viewsByName["Machucado"]?.layer.removeAnimation(forKey: "story4_ImageContents")
		self.viewsByName["Fala9_mask__root"]?.layer.removeAnimation(forKey: "story4_TranslationX")
		self.viewsByName["Fala9_mask__root"]?.layer.removeAnimation(forKey: "story4_TranslationY")
		self.viewsByName["Icepack__root"]?.layer.removeAnimation(forKey: "story4_Opacity")
		self.viewsByName["Icepack__root"]?.layer.removeAnimation(forKey: "story4_TranslationX")
		self.viewsByName["Icepack__root"]?.layer.removeAnimation(forKey: "story4_TranslationY")
		self.viewsByName["Roxo costas__root"]?.layer.removeAnimation(forKey: "story4_Opacity")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	override func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "Story4")
	}
}
