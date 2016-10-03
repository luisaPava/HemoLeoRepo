////
//// Storytelling5View.swift
//// Generated by Core Animator version 1.3 on 7/22/16.
////
//// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
////
//
import UIKit
//
@IBDesignable
class Storytelling5View : UIView {
//
//
//	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
//	var viewsByName: [String : UIView]!
//
//	// - MARK: Life Cycle
//
//	convenience init() {
//		self.init(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
//	}
//
//	override init(frame: CGRect) {
//		super.init(frame: frame)
//		self.setupHierarchy()
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		super.init(coder: aDecoder)
//		self.setupHierarchy()
//	}
//
//	// - MARK: Scaling
//
//	override func layoutSubviews() {
//		super.layoutSubviews()
//
//		if let scalingView = self.viewsByName["__scaling__"] {
//			var xScale = self.bounds.size.width / scalingView.bounds.size.width
//			var yScale = self.bounds.size.height / scalingView.bounds.size.height
//			switch contentMode {
//			case .scaleToFill:
//				break
//			case .scaleAspectFill:
//				let scale = max(xScale, yScale)
//				xScale = scale
//				yScale = scale
//			default:
//				let scale = min(xScale, yScale)
//				xScale = scale
//				yScale = scale
//			}
//			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
//			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
//		}
//	}
//
//	// - MARK: Setup
//
//	func setupHierarchy() {
//		var viewsByName: [String : UIView] = [:]
//		let bundle = Bundle(for:type(of: self))
//		let __scaling__ = UIView()
//		__scaling__.bounds = CGRect(x:0, y:0, width:1024, height:768)
//		__scaling__.center = CGPoint(x:512.0, y:384.0)
//		self.addSubview(__scaling__)
//		viewsByName["__scaling__"] = __scaling__
//
//		let fala9 = UIImageView()
//		fala9.bounds = CGRect(x:0, y:0, width:803.0, height:180.0)
//		var imgFala9: UIImage!
//		if let imagePath = bundle.path(forResource: "Fala9.png", ofType:nil) {
//			imgFala9 = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Fala9.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		fala9.image = imgFala9
//		fala9.contentMode = .center
//		fala9.layer.position = CGPoint(x:577.953, y:161.941)
//		__scaling__.addSubview(fala9)
//		viewsByName["Fala9"] = fala9
//
//		let fala9Mask = UIImageView()
//		fala9Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
//		var imgGradient2: UIImage!
//		if let imagePath = bundle.path(forResource: "gradient2.png", ofType:nil) {
//			imgGradient2 = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'gradient2.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		fala9Mask.image = imgGradient2
//		fala9Mask.contentMode = .center
//		fala9Mask.layer.position = CGPoint(x:-739.000, y:90.084)
//		fala9Mask.transform = CGAffineTransform(rotationAngle: 4.71).scaledBy(x: 1.23, y: 12.63)
//		fala9.mask = fala9Mask
//		viewsByName["Fala9_mask"] = fala9Mask
//
//		let fala8 = UIImageView()
//		fala8.bounds = CGRect(x:0, y:0, width:803.0, height:243.0)
//		var imgFala8: UIImage!
//		if let imagePath = bundle.path(forResource: "Fala8.png", ofType:nil) {
//			imgFala8 = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Fala8.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		fala8.image = imgFala8
//		fala8.contentMode = .center
//		fala8.layer.position = CGPoint(x:580.022, y:193.603)
//		__scaling__.addSubview(fala8)
//		viewsByName["Fala8"] = fala8
//
//		let fala8Mask = UIImageView()
//		fala8Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
//		fala8Mask.image = imgGradient2
//		fala8Mask.contentMode = .center
//		fala8Mask.layer.position = CGPoint(x:-818.000, y:121.280)
//		fala8Mask.transform = CGAffineTransform(rotationAngle: 4.71).scaledBy(x: 1.41, y: 14.04)
//		fala8.mask = fala8Mask
//		viewsByName["Fala8_mask"] = fala8Mask
//
//		let leoFalando = UIImageView()
//		leoFalando.bounds = CGRect(x:0, y:0, width:170.0, height:179.0)
//		var imgLeoDoCorpo: UIImage!
//		if let imagePath = bundle.path(forResource: "Leo do corpo.png", ofType:nil) {
//			imgLeoDoCorpo = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Leo do corpo.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		leoFalando.image = imgLeoDoCorpo
//		leoFalando.contentMode = .center
//		leoFalando.layer.position = CGPoint(x:110.714, y:119.535)
//		leoFalando.transform = CGAffineTransform(scaleX: 0.00, y: 0.00)
//		__scaling__.addSubview(leoFalando)
//		viewsByName["Leo falando"] = leoFalando
//
//		let movement = UIImageView()
//		movement.bounds = CGRect(x:0, y:0, width:56.0, height:16.0)
//		var imgArrow: UIImage!
//		if let imagePath = bundle.path(forResource: "arrow.png", ofType:nil) {
//			imgArrow = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'arrow.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		movement.image = imgArrow
//		movement.contentMode = .center
//		movement.layer.position = CGPoint(x:908.000, y:708.000)
//		movement.transform = CGAffineTransform(scaleX: 1.40, y: 1.40)
//		__scaling__.addSubview(movement)
//		viewsByName["Movement"] = movement
//
//		let movementMask = UIImageView()
//		movementMask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
//		movementMask.image = imgGradient2
//		movementMask.contentMode = .center
//		movementMask.layer.position = CGPoint(x:136.000, y:5.000)
//		movementMask.transform = CGAffineTransform(rotationAngle: 4.71).scaledBy(x: 0.17, y: 1.06)
//		movement.mask = movementMask
//		viewsByName["Movement_mask"] = movementMask
//
//		let hand = UIImageView()
//		hand.bounds = CGRect(x:0, y:0, width:54.0, height:50.0)
//		var imgHand: UIImage!
//		if let imagePath = bundle.path(forResource: "hand.png", ofType:nil) {
//			imgHand = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'hand.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		hand.image = imgHand
//		hand.contentMode = .center
//		hand.layer.position = CGPoint(x:958.925, y:728.962)
//		hand.transform = CGAffineTransform(scaleX: 0.00, y: 0.00)
//		__scaling__.addSubview(hand)
//		viewsByName["hand"] = hand
//
//		let leao = UIView()
//		leao.bounds = CGRect(x:0, y:0, width:348.9, height:330.0)
//		leao.layer.position = CGPoint(x:512.000, y:548.995)
//		__scaling__.addSubview(leao)
//		viewsByName["Leao"] = leao
//
//		let corpoEmPeComMachucado = UIImageView()
//		corpoEmPeComMachucado.bounds = CGRect(x:0, y:0, width:245.0, height:205.0)
//		var imgCorpoEmPeComMachucado: UIImage!
//		if let imagePath = bundle.path(forResource: "Corpo em pe com machucado.png", ofType:nil) {
//			imgCorpoEmPeComMachucado = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Corpo em pe com machucado.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		corpoEmPeComMachucado.image = imgCorpoEmPeComMachucado
//		corpoEmPeComMachucado.contentMode = .center
//		corpoEmPeComMachucado.layer.position = CGPoint(x:122.500, y:227.491)
//		leao.addSubview(corpoEmPeComMachucado)
//		viewsByName["Corpo em pe com machucado"] = corpoEmPeComMachucado
//
//		let leoMachucadoCabeça = UIImageView()
//		leoMachucadoCabeça.bounds = CGRect(x:0, y:0, width:228.0, height:240.0)
//		var imgLeoMachucadoCabeça: UIImage!
//		if let imagePath = bundle.path(forResource: "Leo Machucado cabeça.png", ofType:nil) {
//			imgLeoMachucadoCabeça = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Leo Machucado cabeça.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		leoMachucadoCabeça.image = imgLeoMachucadoCabeça
//		leoMachucadoCabeça.contentMode = .center
//		leoMachucadoCabeça.layer.position = CGPoint(x:234.884, y:120.000)
//		leao.addSubview(leoMachucadoCabeça)
//		viewsByName["Leo Machucado cabeça"] = leoMachucadoCabeça
//
//		let roxoCostas = UIImageView()
//		roxoCostas.bounds = CGRect(x:0, y:0, width:32.0, height:16.0)
//		var imgRoxoCostas: UIImage!
//		if let imagePath = bundle.path(forResource: "Roxo costas.png", ofType:nil) {
//			imgRoxoCostas = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Roxo costas.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		roxoCostas.image = imgRoxoCostas
//		roxoCostas.contentMode = .center
//		roxoCostas.layer.position = CGPoint(x:82.573, y:161.531)
//		leao.addSubview(roxoCostas)
//		viewsByName["Roxo costas"] = roxoCostas
//
//		let roxoPata = UIImageView()
//		roxoPata.bounds = CGRect(x:0, y:0, width:11.0, height:17.0)
//		var imgRoxoPata: UIImage!
//		if let imagePath = bundle.path(forResource: "Roxo pata.png", ofType:nil) {
//			imgRoxoPata = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Roxo pata.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		roxoPata.image = imgRoxoPata
//		roxoPata.contentMode = .center
//		roxoPata.layer.position = CGPoint(x:143.105, y:277.516)
//		leao.addSubview(roxoPata)
//		viewsByName["Roxo pata"] = roxoPata
//
//		let roxoPata2 = UIImageView()
//		roxoPata2.bounds = CGRect(x:0, y:0, width:15.0, height:21.0)
//		var imgRoxoPata2: UIImage!
//		if let imagePath = bundle.path(forResource: "Roxo pata2.png", ofType:nil) {
//			imgRoxoPata2 = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Roxo pata2.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		roxoPata2.image = imgRoxoPata2
//		roxoPata2.contentMode = .center
//		roxoPata2.layer.position = CGPoint(x:157.702, y:243.875)
//		leao.addSubview(roxoPata2)
//		viewsByName["Roxo pata2"] = roxoPata2
//
//		let icepack = UIImageView()
//		icepack.bounds = CGRect(x:0, y:0, width:61.0, height:64.0)
//		var imgIcepack: UIImage!
//		if let imagePath = bundle.path(forResource: "Icepack.png", ofType:nil) {
//			imgIcepack = UIImage(contentsOfFile:imagePath)
//		}else {
//			print("** Warning: Could not create image from 'Icepack.png'. Please make sure that it is added to the project directly (not in a folder reference).")
//		}
//		icepack.image = imgIcepack
//		icepack.contentMode = .center
//		icepack.layer.position = CGPoint(x:345.594, y:393.078)
//		icepack.alpha = 0.00
//		__scaling__.addSubview(icepack)
//		viewsByName["Icepack"] = icepack
//
//		self.viewsByName = viewsByName
//	}
//
//	// - MARK: story4
//
	func addStory4Animation() {
//		addStory4AnimationWithBeginTime(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}
//
//	func addStory4Animation(completion: ((Bool) -> Void)?) {
//		addStory4AnimationWithBeginTime(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
//	}
//
//	func addStory4Animation(removedOnCompletion: Bool) {
//		addStory4AnimationWithBeginTime(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
//	}
//
//	func addStory4Animation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
//		addStory4AnimationWithBeginTime(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
//	}
//
//	func addStory4AnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
//		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
//		if let complete = completion {
//			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
//			representativeAnimation.duration = 16.050
//			representativeAnimation.delegate = self
//			self.layer.add(representativeAnimation, forKey: "Story4")
//			self.animationCompletions[layer.animation(forKey: "Story4")!] = complete
//		}
//
//		let roxoPata2OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
//		roxoPata2OpacityAnimation.duration = 16.050
//		roxoPata2OpacityAnimation.values = [1.000 as Float, 1.000 as Float, 0.000 as Float, 0.000 as Float]
//		roxoPata2OpacityAnimation.keyTimes = [NSNumber(0.000 as Float), 0.735 as Float, 0.773 as Float, 1.000 as Float]
//		roxoPata2OpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		roxoPata2OpacityAnimation.beginTime = beginTime
//		roxoPata2OpacityAnimation.fillMode = fillMode
//		roxoPata2OpacityAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Roxo pata2"]?.layer.add(roxoPata2OpacityAnimation, forKey:"story4_Opacity")
//
//		let leoMachucadoCabeçaRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
//		leoMachucadoCabeçaRotationAnimation.duration = 16.050
//		leoMachucadoCabeçaRotationAnimation.values = [0.000 as Float, 0.000 as Float, 0.087 as Float, 0.000 as Float, -0.087 as Float, 0.000 as Float, 0.087 as Float, 0.000 as Float, -0.087 as Float, 0.000 as Float, 0.087 as Float, 0.000 as Float, -0.087 as Float, 0.000 as Float, 0.087 as Float, 0.000 as Float, -0.087 as Float, -0.087 as Float]
//		leoMachucadoCabeçaRotationAnimation.keyTimes = [NSNumber(0.000 as Float), 0.050 as Float, 0.090 as Float, 0.125 as Float, 0.156 as Float, 0.184 as Float, 0.224 as Float, 0.259 as Float, 0.290 as Float, 0.324 as Float, 0.364 as Float, 0.399 as Float, 0.430 as Float, 0.458 as Float, 0.498 as Float, 0.533 as Float, 0.564 as Float, 1.000 as Float]
//		leoMachucadoCabeçaRotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
//		leoMachucadoCabeçaRotationAnimation.beginTime = beginTime
//		leoMachucadoCabeçaRotationAnimation.fillMode = fillMode
//		leoMachucadoCabeçaRotationAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Leo Machucado cabeça"]?.layer.add(leoMachucadoCabeçaRotationAnimation, forKey:"story4_Rotation")
//
//		let leoMachucadoCabeçaImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
//		leoMachucadoCabeçaImageContentsAnimation.duration = 16.050
//		leoMachucadoCabeçaImageContentsAnimation.values = [UIImage(named: "Leo Machucado cabeça.png")!.cgImage!, UIImage(named: "Leo Machucado cabeça.png")!.cgImage!, UIImage(named: "Cabeça leo feliz.png")!.cgImage!, UIImage(named: "Cabeça leo feliz.png")!.cgImage!, UIImage(named: "Cabeça leo feliz.png")!.cgImage!]
//		leoMachucadoCabeçaImageContentsAnimation.keyTimes = [NSNumber(0.000 as Float), 0.931 as Float, 0.931 as Float, 1.000 as Float, 1.000 as Float]
//		leoMachucadoCabeçaImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming]
//		leoMachucadoCabeçaImageContentsAnimation.beginTime = beginTime
//		leoMachucadoCabeçaImageContentsAnimation.fillMode = fillMode
//		leoMachucadoCabeçaImageContentsAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Leo Machucado cabeça"]?.layer.add(leoMachucadoCabeçaImageContentsAnimation, forKey:"story4_ImageContents")
//
//		let fala8MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//		fala8MaskTranslationXAnimation.duration = 16.050
//		fala8MaskTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 1635.000 as Float, 1635.000 as Float, 0.000 as Float, 0.000 as Float]
//		fala8MaskTranslationXAnimation.keyTimes = [NSNumber(0.000 as Float), 0.025 as Float, 0.050 as Float, 0.555 as Float, 0.586 as Float, 1.000 as Float]
//		fala8MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
//		fala8MaskTranslationXAnimation.beginTime = beginTime
//		fala8MaskTranslationXAnimation.fillMode = fillMode
//		fala8MaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Fala8_mask"]?.layer.add(fala8MaskTranslationXAnimation, forKey:"story4_TranslationX")
//
//		let fala8MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
//		fala8MaskTranslationYAnimation.duration = 16.050
//		fala8MaskTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float, 0.000 as Float]
//		fala8MaskTranslationYAnimation.keyTimes = [NSNumber(0.000 as Float), 0.025 as Float, 0.555 as Float, 1.000 as Float]
//		fala8MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		fala8MaskTranslationYAnimation.beginTime = beginTime
//		fala8MaskTranslationYAnimation.fillMode = fillMode
//		fala8MaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Fala8_mask"]?.layer.add(fala8MaskTranslationYAnimation, forKey:"story4_TranslationY")
//
//		let fala9MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//		fala9MaskTranslationXAnimation.duration = 16.050
//		fala9MaskTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 1480.000 as Float, 1480.000 as Float]
//		fala9MaskTranslationXAnimation.keyTimes = [NSNumber(0.000 as Float), 0.586 as Float, 0.611 as Float, 1.000 as Float]
//		fala9MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		fala9MaskTranslationXAnimation.beginTime = beginTime
//		fala9MaskTranslationXAnimation.fillMode = fillMode
//		fala9MaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Fala9_mask"]?.layer.add(fala9MaskTranslationXAnimation, forKey:"story4_TranslationX")
//
//		let fala9MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
//		fala9MaskTranslationYAnimation.duration = 16.050
//		fala9MaskTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float]
//		fala9MaskTranslationYAnimation.keyTimes = [NSNumber(0.000 as Float), 0.586 as Float, 1.000 as Float]
//		fala9MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
//		fala9MaskTranslationYAnimation.beginTime = beginTime
//		fala9MaskTranslationYAnimation.fillMode = fillMode
//		fala9MaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Fala9_mask"]?.layer.add(fala9MaskTranslationYAnimation, forKey:"story4_TranslationY")
//
//		let icepackOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
//		icepackOpacityAnimation.duration = 16.050
//		icepackOpacityAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float, 0.000 as Float]
//		icepackOpacityAnimation.keyTimes = [NSNumber(0.000 as Float), 0.603 as Float, 0.629 as Float, 0.972 as Float, 1.000 as Float]
//		icepackOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming]
//		icepackOpacityAnimation.beginTime = beginTime
//		icepackOpacityAnimation.fillMode = fillMode
//		icepackOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Icepack"]?.layer.add(icepackOpacityAnimation, forKey:"story4_Opacity")
//
//		let icepackTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//		icepackTranslationXAnimation.duration = 16.050
//		icepackTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 68.809 as Float, 68.809 as Float, 145.366 as Float, 145.366 as Float, 141.472 as Float, 141.472 as Float, 53.169 as Float, 53.169 as Float, 534.084 as Float, 534.084 as Float]
//		icepackTranslationXAnimation.keyTimes = [NSNumber(0.000 as Float), 0.631 as Float, 0.670 as Float, 0.698 as Float, 0.735 as Float, 0.776 as Float, 0.813 as Float, 0.854 as Float, 0.891 as Float, 0.931 as Float, 0.972 as Float, 1.000 as Float]
//		icepackTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
//		icepackTranslationXAnimation.beginTime = beginTime
//		icepackTranslationXAnimation.fillMode = fillMode
//		icepackTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Icepack"]?.layer.add(icepackTranslationXAnimation, forKey:"story4_TranslationX")
//
//		let icepackTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
//		icepackTranslationYAnimation.duration = 16.050
//		icepackTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 138.481 as Float, 138.481 as Float, 216.328 as Float, 216.328 as Float, 250.984 as Float, 250.984 as Float, 216.156 as Float, 216.156 as Float, 67.144 as Float, 67.144 as Float]
//		icepackTranslationYAnimation.keyTimes = [NSNumber(0.000 as Float), 0.631 as Float, 0.670 as Float, 0.698 as Float, 0.735 as Float, 0.776 as Float, 0.813 as Float, 0.854 as Float, 0.891 as Float, 0.931 as Float, 0.972 as Float, 1.000 as Float]
//		icepackTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
//		icepackTranslationYAnimation.beginTime = beginTime
//		icepackTranslationYAnimation.fillMode = fillMode
//		icepackTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Icepack"]?.layer.add(icepackTranslationYAnimation, forKey:"story4_TranslationY")
//
//		let roxoCostasOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
//		roxoCostasOpacityAnimation.duration = 16.050
//		roxoCostasOpacityAnimation.values = [1.000 as Float, 1.000 as Float, 0.000 as Float, 0.000 as Float]
//		roxoCostasOpacityAnimation.keyTimes = [NSNumber(0.000 as Float), 0.673 as Float, 0.698 as Float, 1.000 as Float]
//		roxoCostasOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		roxoCostasOpacityAnimation.beginTime = beginTime
//		roxoCostasOpacityAnimation.fillMode = fillMode
//		roxoCostasOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Roxo costas"]?.layer.add(roxoCostasOpacityAnimation, forKey:"story4_Opacity")
//
//		let leoFalandoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
//		leoFalandoScaleXAnimation.duration = 16.050
//		leoFalandoScaleXAnimation.values = [0.000 as Float, 1.100 as Float, 1.000 as Float, 1.000 as Float]
//		leoFalandoScaleXAnimation.keyTimes = [NSNumber(0.000 as Float), 0.019 as Float, 0.025 as Float, 1.000 as Float]
//		leoFalandoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		leoFalandoScaleXAnimation.beginTime = beginTime
//		leoFalandoScaleXAnimation.fillMode = fillMode
//		leoFalandoScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Leo falando"]?.layer.add(leoFalandoScaleXAnimation, forKey:"story4_ScaleX")
//
//		let leoFalandoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
//		leoFalandoScaleYAnimation.duration = 16.050
//		leoFalandoScaleYAnimation.values = [0.000 as Float, 1.100 as Float, 1.000 as Float, 1.000 as Float]
//		leoFalandoScaleYAnimation.keyTimes = [NSNumber(0.000 as Float), 0.019 as Float, 0.025 as Float, 1.000 as Float]
//		leoFalandoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		leoFalandoScaleYAnimation.beginTime = beginTime
//		leoFalandoScaleYAnimation.fillMode = fillMode
//		leoFalandoScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Leo falando"]?.layer.add(leoFalandoScaleYAnimation, forKey:"story4_ScaleY")
//
//		let corpoEmPeComMachucadoImageContentsAnimation = CAKeyframeAnimation(keyPath: "contents")
//		corpoEmPeComMachucadoImageContentsAnimation.duration = 16.050
//		corpoEmPeComMachucadoImageContentsAnimation.values = [UIImage(named: "Corpo em pe com machucado.png")!.cgImage!, UIImage(named: "Corpo em pe com machucado.png")!.cgImage!, UIImage(named: "Corpo em pe machucado melhor.png")!.cgImage!, UIImage(named: "Corpo em pe machucado melhor.png")!.cgImage!, UIImage(named: "Corpo em pe machucado melhor.png")!.cgImage!]
//		corpoEmPeComMachucadoImageContentsAnimation.keyTimes = [NSNumber(0.000 as Float), 0.891 as Float, 0.891 as Float, 1.000 as Float, 1.000 as Float]
//		corpoEmPeComMachucadoImageContentsAnimation.timingFunctions = [instantTiming, instantTiming, instantTiming, instantTiming]
//		corpoEmPeComMachucadoImageContentsAnimation.beginTime = beginTime
//		corpoEmPeComMachucadoImageContentsAnimation.fillMode = fillMode
//		corpoEmPeComMachucadoImageContentsAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Corpo em pe com machucado"]?.layer.add(corpoEmPeComMachucadoImageContentsAnimation, forKey:"story4_ImageContents")
//
//		let roxoPataOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
//		roxoPataOpacityAnimation.duration = 16.050
//		roxoPataOpacityAnimation.values = [1.000 as Float, 1.000 as Float, 0.000 as Float, 0.000 as Float]
//		roxoPataOpacityAnimation.keyTimes = [NSNumber(0.000 as Float), 0.813 as Float, 0.850 as Float, 1.000 as Float]
//		roxoPataOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
//		roxoPataOpacityAnimation.beginTime = beginTime
//		roxoPataOpacityAnimation.fillMode = fillMode
//		roxoPataOpacityAnimation.isRemovedOnCompletion = removedOnCompletion
//		self.viewsByName["Roxo pata"]?.layer.add(roxoPataOpacityAnimation, forKey:"story4_Opacity")
//	}
//
//	func removeStory4Animation() {
//		self.layer.removeAnimation(forKey: "Story4")
//		self.viewsByName["Roxo pata2"]?.layer.removeAnimation(forKey: "story4_Opacity")
//		self.viewsByName["Leo Machucado cabeça"]?.layer.removeAnimation(forKey: "story4_Rotation")
//		self.viewsByName["Leo Machucado cabeça"]?.layer.removeAnimation(forKey: "story4_ImageContents")
//		self.viewsByName["Fala8_mask"]?.layer.removeAnimation(forKey: "story4_TranslationX")
//		self.viewsByName["Fala8_mask"]?.layer.removeAnimation(forKey: "story4_TranslationY")
//		self.viewsByName["Fala9_mask"]?.layer.removeAnimation(forKey: "story4_TranslationX")
//		self.viewsByName["Fala9_mask"]?.layer.removeAnimation(forKey: "story4_TranslationY")
//		self.viewsByName["Icepack"]?.layer.removeAnimation(forKey: "story4_Opacity")
//		self.viewsByName["Icepack"]?.layer.removeAnimation(forKey: "story4_TranslationX")
//		self.viewsByName["Icepack"]?.layer.removeAnimation(forKey: "story4_TranslationY")
//		self.viewsByName["Roxo costas"]?.layer.removeAnimation(forKey: "story4_Opacity")
//		self.viewsByName["Leo falando"]?.layer.removeAnimation(forKey: "story4_ScaleX")
//		self.viewsByName["Leo falando"]?.layer.removeAnimation(forKey: "story4_ScaleY")
//		self.viewsByName["Corpo em pe com machucado"]?.layer.removeAnimation(forKey: "story4_ImageContents")
//		self.viewsByName["Roxo pata"]?.layer.removeAnimation(forKey: "story4_Opacity")
//	}
//
//	override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//		if let completion = self.animationCompletions[anim] {
//			self.animationCompletions.removeValue(forKey: anim)
//			completion(flag)
//		}
//	}
//
//	override func removeAllAnimations() {
//		for subview in viewsByName.values {
//			subview.layer.removeAllAnimations()
//		}
//		self.layer.removeAnimation(forKey: "Story4")
//	}
}
