//
// Storytelling4View.swift
// Generated by Core Animator version 1.3 on 7/22/16.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

@IBDesignable
class Storytelling4View : UIView {


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
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:1024, height:768)
		__scaling__.center = CGPoint(x:512.0, y:384.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let fala7 = UIImageView()
		fala7.bounds = CGRect(x:0, y:0, width:803.0, height:254.0)
		var imgFala7: UIImage!
		if let imagePath = bundle.pathForResource("Fala7.png", ofType:nil) {
			imgFala7 = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Fala7.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		fala7.image = imgFala7
		fala7.contentMode = .Center
		fala7.layer.position = CGPoint(x:579.169, y:199.996)
		__scaling__.addSubview(fala7)
		viewsByName["Fala7"] = fala7

		let fala7Mask = UIImageView()
		fala7Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		var imgGradient2: UIImage!
		if let imagePath = bundle.pathForResource("gradient2.png", ofType:nil) {
			imgGradient2 = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'gradient2.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		fala7Mask.image = imgGradient2
		fala7Mask.contentMode = .Center
		fala7Mask.layer.position = CGPoint(x:-747.000, y:114.637)
		fala7Mask.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(4.71), 1.66, 12.95)
		fala7.maskView = fala7Mask
		viewsByName["Fala7_mask"] = fala7Mask

		let fala6 = UIImageView()
		fala6.bounds = CGRect(x:0, y:0, width:803.0, height:172.0)
		var imgFala6: UIImage!
		if let imagePath = bundle.pathForResource("Fala6.png", ofType:nil) {
			imgFala6 = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Fala6.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		fala6.image = imgFala6
		fala6.contentMode = .Center
		fala6.layer.position = CGPoint(x:579.253, y:157.878)
		__scaling__.addSubview(fala6)
		viewsByName["Fala6"] = fala6

		let fala6Mask = UIImageView()
		fala6Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		fala6Mask.image = imgGradient2
		fala6Mask.contentMode = .Center
		fala6Mask.layer.position = CGPoint(x:-724.000, y:87.490)
		fala6Mask.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(4.72), 1.46, 12.43)
		fala6.maskView = fala6Mask
		viewsByName["Fala6_mask"] = fala6Mask

		let leoFalando = UIImageView()
		leoFalando.bounds = CGRect(x:0, y:0, width:170.0, height:179.0)
		var imgLeoTriste: UIImage!
		if let imagePath = bundle.pathForResource("Leo triste.png", ofType:nil) {
			imgLeoTriste = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Leo triste.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		leoFalando.image = imgLeoTriste
		leoFalando.contentMode = .Center
		leoFalando.layer.position = CGPoint(x:110.714, y:119.535)
		leoFalando.transform = CGAffineTransformMakeScale(0.00, 0.00)
		__scaling__.addSubview(leoFalando)
		viewsByName["Leo falando"] = leoFalando

		let leoTriste = UIImageView()
		leoTriste.bounds = CGRect(x:0, y:0, width:170.0, height:179.0)
		leoTriste.image = imgLeoTriste
		leoTriste.contentMode = .Center
		leoTriste.layer.position = CGPoint(x:1165.756, y:0.000)
		__scaling__.addSubview(leoTriste)
		viewsByName["Leo triste"] = leoTriste

		let movement = UIImageView()
		movement.bounds = CGRect(x:0, y:0, width:56.0, height:16.0)
		var imgArrow: UIImage!
		if let imagePath = bundle.pathForResource("arrow.png", ofType:nil) {
			imgArrow = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'arrow.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		movement.image = imgArrow
		movement.contentMode = .Center
		movement.layer.position = CGPoint(x:908.000, y:708.000)
		movement.transform = CGAffineTransformMakeScale(1.40, 1.40)
		__scaling__.addSubview(movement)
		viewsByName["Movement"] = movement

		let movementMask = UIImageView()
		movementMask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		movementMask.image = imgGradient2
		movementMask.contentMode = .Center
		movementMask.layer.position = CGPoint(x:136.000, y:5.000)
		movementMask.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(4.71), 0.17, 1.06)
		movement.maskView = movementMask
		viewsByName["Movement_mask"] = movementMask

		let hand = UIImageView()
		hand.bounds = CGRect(x:0, y:0, width:54.0, height:50.0)
		var imgHand: UIImage!
		if let imagePath = bundle.pathForResource("hand.png", ofType:nil) {
			imgHand = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'hand.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		hand.image = imgHand
		hand.contentMode = .Center
		hand.layer.position = CGPoint(x:958.925, y:728.962)
		hand.transform = CGAffineTransformMakeScale(0.00, 0.00)
		__scaling__.addSubview(hand)
		viewsByName["hand"] = hand

		let leao = UIView()
		leao.bounds = CGRect(x:0, y:0, width:348.9, height:330.0)
		leao.layer.position = CGPoint(x:512.000, y:548.995)
		__scaling__.addSubview(leao)
		viewsByName["Leao"] = leao

		let corpoEmPeComMachucado = UIImageView()
		corpoEmPeComMachucado.bounds = CGRect(x:0, y:0, width:245.0, height:205.0)
		var imgCorpoEmPeComMachucado: UIImage!
		if let imagePath = bundle.pathForResource("Corpo em pe com machucado.png", ofType:nil) {
			imgCorpoEmPeComMachucado = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Corpo em pe com machucado.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		corpoEmPeComMachucado.image = imgCorpoEmPeComMachucado
		corpoEmPeComMachucado.contentMode = .Center
		corpoEmPeComMachucado.layer.position = CGPoint(x:122.500, y:227.491)
		leao.addSubview(corpoEmPeComMachucado)
		viewsByName["Corpo em pe com machucado"] = corpoEmPeComMachucado

		let leoMachucadoCabeça = UIImageView()
		leoMachucadoCabeça.bounds = CGRect(x:0, y:0, width:228.0, height:240.0)
		var imgLeoMachucadoCabeça: UIImage!
		if let imagePath = bundle.pathForResource("Leo Machucado cabeça.png", ofType:nil) {
			imgLeoMachucadoCabeça = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Leo Machucado cabeça.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		leoMachucadoCabeça.image = imgLeoMachucadoCabeça
		leoMachucadoCabeça.contentMode = .Center
		leoMachucadoCabeça.layer.position = CGPoint(x:234.884, y:120.000)
		leao.addSubview(leoMachucadoCabeça)
		viewsByName["Leo Machucado cabeça"] = leoMachucadoCabeça

		let roxoCostas = UIImageView()
		roxoCostas.bounds = CGRect(x:0, y:0, width:32.0, height:16.0)
		var imgRoxoCostas: UIImage!
		if let imagePath = bundle.pathForResource("Roxo costas.png", ofType:nil) {
			imgRoxoCostas = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Roxo costas.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		roxoCostas.image = imgRoxoCostas
		roxoCostas.contentMode = .Center
		roxoCostas.layer.position = CGPoint(x:82.573, y:161.531)
		roxoCostas.alpha = 0.00
		leao.addSubview(roxoCostas)
		viewsByName["Roxo costas"] = roxoCostas

		let roxoPata = UIImageView()
		roxoPata.bounds = CGRect(x:0, y:0, width:11.0, height:17.0)
		var imgRoxoPata: UIImage!
		if let imagePath = bundle.pathForResource("Roxo pata.png", ofType:nil) {
			imgRoxoPata = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Roxo pata.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		roxoPata.image = imgRoxoPata
		roxoPata.contentMode = .Center
		roxoPata.layer.position = CGPoint(x:143.105, y:277.516)
		roxoPata.alpha = 0.00
		leao.addSubview(roxoPata)
		viewsByName["Roxo pata"] = roxoPata

		let roxoPata2 = UIImageView()
		roxoPata2.bounds = CGRect(x:0, y:0, width:15.0, height:21.0)
		var imgRoxoPata2: UIImage!
		if let imagePath = bundle.pathForResource("Roxo pata2.png", ofType:nil) {
			imgRoxoPata2 = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'Roxo pata2.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		roxoPata2.image = imgRoxoPata2
		roxoPata2.contentMode = .Center
		roxoPata2.layer.position = CGPoint(x:157.702, y:243.875)
		roxoPata2.alpha = 0.00
		leao.addSubview(roxoPata2)
		viewsByName["Roxo pata2"] = roxoPata2

		let arrow = UIImageView()
		arrow.bounds = CGRect(x:0, y:0, width:56.0, height:16.0)
		arrow.image = imgArrow
		arrow.contentMode = .Center
		arrow.layer.position = CGPoint(x:1067.862, y:677.372)
		__scaling__.addSubview(arrow)
		viewsByName["arrow"] = arrow

		self.viewsByName = viewsByName
	}

	// - MARK: story4

	func addStory4Animation() {
		addStory4AnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addStory4Animation(completion: ((Bool) -> Void)?) {
		addStory4AnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addStory4Animation(removedOnCompletion removedOnCompletion: Bool) {
		addStory4AnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addStory4Animation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addStory4AnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addStory4AnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 12.150
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Story4")
			self.animationCompletions[layer.animationForKey("Story4")!] = complete
		}

		let leoMachucadoCabeçaRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		leoMachucadoCabeçaRotationAnimation.duration = 12.150
		leoMachucadoCabeçaRotationAnimation.values = [0.000 as Float, 0.000 as Float, 0.052 as Float, 0.000 as Float, -0.052 as Float, 0.000 as Float, 0.052 as Float, 0.000 as Float, -0.052 as Float, 0.000 as Float, 0.052 as Float, 0.000 as Float, -0.052 as Float, 0.000 as Float, 0.052 as Float, 0.000 as Float, -0.052 as Float, -0.052 as Float]
		leoMachucadoCabeçaRotationAnimation.keyTimes = [0.000 as Float, 0.066 as Float, 0.119 as Float, 0.165 as Float, 0.206 as Float, 0.251 as Float, 0.305 as Float, 0.350 as Float, 0.391 as Float, 0.453 as Float, 0.494 as Float, 0.535 as Float, 0.576 as Float, 0.617 as Float, 0.658 as Float, 0.700 as Float, 0.741 as Float, 1.000 as Float]
		leoMachucadoCabeçaRotationAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		leoMachucadoCabeçaRotationAnimation.beginTime = beginTime
		leoMachucadoCabeçaRotationAnimation.fillMode = fillMode
		leoMachucadoCabeçaRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Leo Machucado cabeça"]?.layer.addAnimation(leoMachucadoCabeçaRotationAnimation, forKey:"story4_Rotation")

		let roxoPata2OpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoPata2OpacityAnimation.duration = 12.150
		roxoPata2OpacityAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		roxoPata2OpacityAnimation.keyTimes = [0.000 as Float, 0.745 as Float, 0.765 as Float, 1.000 as Float]
		roxoPata2OpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoPata2OpacityAnimation.beginTime = beginTime
		roxoPata2OpacityAnimation.fillMode = fillMode
		roxoPata2OpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo pata2"]?.layer.addAnimation(roxoPata2OpacityAnimation, forKey:"story4_Opacity")

		let leoFalandoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		leoFalandoScaleXAnimation.duration = 12.150
		leoFalandoScaleXAnimation.values = [0.000 as Float, 1.100 as Float, 1.000 as Float, 1.000 as Float]
		leoFalandoScaleXAnimation.keyTimes = [0.000 as Float, 0.025 as Float, 0.033 as Float, 1.000 as Float]
		leoFalandoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleXAnimation.beginTime = beginTime
		leoFalandoScaleXAnimation.fillMode = fillMode
		leoFalandoScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando"]?.layer.addAnimation(leoFalandoScaleXAnimation, forKey:"story4_ScaleX")

		let leoFalandoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		leoFalandoScaleYAnimation.duration = 12.150
		leoFalandoScaleYAnimation.values = [0.000 as Float, 1.100 as Float, 1.000 as Float, 1.000 as Float]
		leoFalandoScaleYAnimation.keyTimes = [0.000 as Float, 0.025 as Float, 0.033 as Float, 1.000 as Float]
		leoFalandoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleYAnimation.beginTime = beginTime
		leoFalandoScaleYAnimation.fillMode = fillMode
		leoFalandoScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando"]?.layer.addAnimation(leoFalandoScaleYAnimation, forKey:"story4_ScaleY")

		let movementMaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		movementMaskTranslationXAnimation.duration = 12.150
		movementMaskTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, -60.000 as Float, -60.000 as Float]
		movementMaskTranslationXAnimation.keyTimes = [0.000 as Float, 0.963 as Float, 0.998 as Float, 1.000 as Float]
		movementMaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		movementMaskTranslationXAnimation.beginTime = beginTime
		movementMaskTranslationXAnimation.fillMode = fillMode
		movementMaskTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Movement_mask"]?.layer.addAnimation(movementMaskTranslationXAnimation, forKey:"story4_TranslationX")

		let movementMaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		movementMaskTranslationYAnimation.duration = 12.150
		movementMaskTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float]
		movementMaskTranslationYAnimation.keyTimes = [0.000 as Float, 0.963 as Float, 1.000 as Float]
		movementMaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		movementMaskTranslationYAnimation.beginTime = beginTime
		movementMaskTranslationYAnimation.fillMode = fillMode
		movementMaskTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Movement_mask"]?.layer.addAnimation(movementMaskTranslationYAnimation, forKey:"story4_TranslationY")

		let fala7MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fala7MaskTranslationXAnimation.duration = 12.150
		fala7MaskTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 1500.000 as Float, 1500.000 as Float]
		fala7MaskTranslationXAnimation.keyTimes = [0.000 as Float, 0.708 as Float, 0.749 as Float, 1.000 as Float]
		fala7MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fala7MaskTranslationXAnimation.beginTime = beginTime
		fala7MaskTranslationXAnimation.fillMode = fillMode
		fala7MaskTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Fala7_mask"]?.layer.addAnimation(fala7MaskTranslationXAnimation, forKey:"story4_TranslationX")

		let fala7MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fala7MaskTranslationYAnimation.duration = 12.150
		fala7MaskTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float]
		fala7MaskTranslationYAnimation.keyTimes = [0.000 as Float, 0.708 as Float, 1.000 as Float]
		fala7MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		fala7MaskTranslationYAnimation.beginTime = beginTime
		fala7MaskTranslationYAnimation.fillMode = fillMode
		fala7MaskTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Fala7_mask"]?.layer.addAnimation(fala7MaskTranslationYAnimation, forKey:"story4_TranslationY")

		let handScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		handScaleXAnimation.duration = 12.150
		handScaleXAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		handScaleXAnimation.keyTimes = [0.000 as Float, 0.942 as Float, 0.963 as Float, 1.000 as Float]
		handScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		handScaleXAnimation.beginTime = beginTime
		handScaleXAnimation.fillMode = fillMode
		handScaleXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["hand"]?.layer.addAnimation(handScaleXAnimation, forKey:"story4_ScaleX")

		let handScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		handScaleYAnimation.duration = 12.150
		handScaleYAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		handScaleYAnimation.keyTimes = [0.000 as Float, 0.942 as Float, 0.963 as Float, 1.000 as Float]
		handScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		handScaleYAnimation.beginTime = beginTime
		handScaleYAnimation.fillMode = fillMode
		handScaleYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["hand"]?.layer.addAnimation(handScaleYAnimation, forKey:"story4_ScaleY")

		let handTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		handTranslationXAnimation.duration = 12.150
		handTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, -70.000 as Float]
		handTranslationXAnimation.keyTimes = [0.000 as Float, 0.969 as Float, 1.000 as Float]
		handTranslationXAnimation.timingFunctions = [linearTiming, linearTiming]
		handTranslationXAnimation.beginTime = beginTime
		handTranslationXAnimation.fillMode = fillMode
		handTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["hand"]?.layer.addAnimation(handTranslationXAnimation, forKey:"story4_TranslationX")

		let handTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		handTranslationYAnimation.duration = 12.150
		handTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float]
		handTranslationYAnimation.keyTimes = [0.000 as Float, 0.969 as Float, 1.000 as Float]
		handTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		handTranslationYAnimation.beginTime = beginTime
		handTranslationYAnimation.fillMode = fillMode
		handTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["hand"]?.layer.addAnimation(handTranslationYAnimation, forKey:"story4_TranslationY")

		let fala6MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fala6MaskTranslationXAnimation.duration = 12.150
		fala6MaskTranslationXAnimation.values = [0.000 as Float, 0.000 as Float, 1450.000 as Float, 1450.000 as Float, 0.000 as Float, 0.000 as Float]
		fala6MaskTranslationXAnimation.keyTimes = [0.000 as Float, 0.033 as Float, 0.066 as Float, 0.658 as Float, 0.704 as Float, 1.000 as Float]
		fala6MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		fala6MaskTranslationXAnimation.beginTime = beginTime
		fala6MaskTranslationXAnimation.fillMode = fillMode
		fala6MaskTranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Fala6_mask"]?.layer.addAnimation(fala6MaskTranslationXAnimation, forKey:"story4_TranslationX")

		let fala6MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fala6MaskTranslationYAnimation.duration = 12.150
		fala6MaskTranslationYAnimation.values = [0.000 as Float, 0.000 as Float, 0.000 as Float, 0.000 as Float]
		fala6MaskTranslationYAnimation.keyTimes = [0.000 as Float, 0.033 as Float, 0.658 as Float, 1.000 as Float]
		fala6MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fala6MaskTranslationYAnimation.beginTime = beginTime
		fala6MaskTranslationYAnimation.fillMode = fillMode
		fala6MaskTranslationYAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Fala6_mask"]?.layer.addAnimation(fala6MaskTranslationYAnimation, forKey:"story4_TranslationY")

		let roxoPataOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoPataOpacityAnimation.duration = 12.150
		roxoPataOpacityAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		roxoPataOpacityAnimation.keyTimes = [0.000 as Float, 0.790 as Float, 0.815 as Float, 1.000 as Float]
		roxoPataOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoPataOpacityAnimation.beginTime = beginTime
		roxoPataOpacityAnimation.fillMode = fillMode
		roxoPataOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo pata"]?.layer.addAnimation(roxoPataOpacityAnimation, forKey:"story4_Opacity")

		let roxoCostasOpacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
		roxoCostasOpacityAnimation.duration = 12.150
		roxoCostasOpacityAnimation.values = [0.000 as Float, 0.000 as Float, 1.000 as Float, 1.000 as Float]
		roxoCostasOpacityAnimation.keyTimes = [0.000 as Float, 0.765 as Float, 0.790 as Float, 1.000 as Float]
		roxoCostasOpacityAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		roxoCostasOpacityAnimation.beginTime = beginTime
		roxoCostasOpacityAnimation.fillMode = fillMode
		roxoCostasOpacityAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Roxo costas"]?.layer.addAnimation(roxoCostasOpacityAnimation, forKey:"story4_Opacity")
	}

	func removeStory4Animation() {
		self.layer.removeAnimationForKey("Story4")
		self.viewsByName["Leo Machucado cabeça"]?.layer.removeAnimationForKey("story4_Rotation")
		self.viewsByName["Roxo pata2"]?.layer.removeAnimationForKey("story4_Opacity")
		self.viewsByName["Leo falando"]?.layer.removeAnimationForKey("story4_ScaleX")
		self.viewsByName["Leo falando"]?.layer.removeAnimationForKey("story4_ScaleY")
		self.viewsByName["Movement_mask"]?.layer.removeAnimationForKey("story4_TranslationX")
		self.viewsByName["Movement_mask"]?.layer.removeAnimationForKey("story4_TranslationY")
		self.viewsByName["Fala7_mask"]?.layer.removeAnimationForKey("story4_TranslationX")
		self.viewsByName["Fala7_mask"]?.layer.removeAnimationForKey("story4_TranslationY")
		self.viewsByName["hand"]?.layer.removeAnimationForKey("story4_ScaleX")
		self.viewsByName["hand"]?.layer.removeAnimationForKey("story4_ScaleY")
		self.viewsByName["hand"]?.layer.removeAnimationForKey("story4_TranslationX")
		self.viewsByName["hand"]?.layer.removeAnimationForKey("story4_TranslationY")
		self.viewsByName["Fala6_mask"]?.layer.removeAnimationForKey("story4_TranslationX")
		self.viewsByName["Fala6_mask"]?.layer.removeAnimationForKey("story4_TranslationY")
		self.viewsByName["Roxo pata"]?.layer.removeAnimationForKey("story4_Opacity")
		self.viewsByName["Roxo costas"]?.layer.removeAnimationForKey("story4_Opacity")
	}

	override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValueForKey(anim)
			completion(flag)
		}
	}

	override func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimationForKey("Story4")
	}
}