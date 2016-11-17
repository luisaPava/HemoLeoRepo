//
// Storytelling2View.swift
// Generated by Core Animator version 1.3.2 on 17/11/16.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

private class Storytelling2PassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class Storytelling2View : UIView, CAAnimationDelegate {


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

		let movement__root = Storytelling2PassthroughView()
		let movement__xScale = Storytelling2PassthroughView()
		let movement__yScale = Storytelling2PassthroughView()
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

		let movementMask__root = Storytelling2PassthroughView()
		let movementMask__xScale = Storytelling2PassthroughView()
		let movementMask__yScale = Storytelling2PassthroughView()
		let movementMask = UIImageView()
		let imgGradient2 = UIImage(named:"gradient2.png", in: bundle, compatibleWith: nil)
		if imgGradient2 == nil {
			print("** Warning: Could not create image from 'gradient2.png'")
		}
		movementMask.image = imgGradient2
		movementMask.contentMode = .center
		movementMask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		movementMask__root.layer.position = CGPoint(x:139.000, y:5.000)
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

		let hand__root = Storytelling2PassthroughView()
		let hand__xScale = Storytelling2PassthroughView()
		let hand__yScale = Storytelling2PassthroughView()
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

		let fala2__root = Storytelling2PassthroughView()
		let fala2__xScale = Storytelling2PassthroughView()
		let fala2__yScale = Storytelling2PassthroughView()
		let fala2 = UIImageView()
		let imgFala2 = UIImage(named:"Fala2.png", in: bundle, compatibleWith: nil)
		if imgFala2 == nil {
			print("** Warning: Could not create image from 'Fala2.png'")
		}
		fala2.image = imgFala2
		fala2.contentMode = .center
		fala2.bounds = CGRect(x:0, y:0, width:803.0, height:202.0)
		fala2__root.layer.position = CGPoint(x:579.315, y:173.865)
		fala2__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala2__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		fala2__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(fala2__root)
		fala2__root.addSubview(fala2__xScale)
		fala2__xScale.addSubview(fala2__yScale)
		fala2__yScale.addSubview(fala2)
		__scaling__.addSubview(fala2__root)
		viewsByName["Fala2__root"] = fala2__root
		viewsByName["Fala2__xScale"] = fala2__xScale
		viewsByName["Fala2__yScale"] = fala2__yScale
		viewsByName["Fala2"] = fala2

		let fala2Mask__root = Storytelling2PassthroughView()
		let fala2Mask__xScale = Storytelling2PassthroughView()
		let fala2Mask__yScale = Storytelling2PassthroughView()
		let fala2Mask = UIImageView()
		fala2Mask.image = imgGradient2
		fala2Mask.contentMode = .center
		fala2Mask.bounds = CGRect(x:0, y:0, width:185.0, height:118.0)
		fala2Mask__root.layer.position = CGPoint(x:-996.768, y:101.000)
		fala2Mask__xScale.transform = CGAffineTransform(scaleX: 1.71, y: 1.00)
		fala2Mask__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 16.76)
		fala2Mask__root.transform = CGAffineTransform(rotationAngle: 4.712)
		fala2.addSubview(fala2Mask__root)
		fala2Mask__root.addSubview(fala2Mask__xScale)
		fala2Mask__xScale.addSubview(fala2Mask__yScale)
		fala2Mask__yScale.addSubview(fala2Mask)
		fala2.mask = fala2Mask__root
		viewsByName["Fala2_mask__root"] = fala2Mask__root
		viewsByName["Fala2_mask__xScale"] = fala2Mask__xScale
		viewsByName["Fala2_mask__yScale"] = fala2Mask__yScale
		viewsByName["Fala2_mask"] = fala2Mask

		let menino__root = Storytelling2PassthroughView()
		let menino__xScale = Storytelling2PassthroughView()
		let menino__yScale = Storytelling2PassthroughView()
		let menino = UIImageView()
		let imgMenino = UIImage(named:"Menino.png", in: bundle, compatibleWith: nil)
		if imgMenino == nil {
			print("** Warning: Could not create image from 'Menino.png'")
		}
		menino.image = imgMenino
		menino.contentMode = .center
		menino.bounds = CGRect(x:0, y:0, width:304.0, height:379.0)
		menino__root.layer.position = CGPoint(x:512.000, y:577.500)
		menino__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		menino__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		menino__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(menino__root)
		menino__root.addSubview(menino__xScale)
		menino__xScale.addSubview(menino__yScale)
		menino__yScale.addSubview(menino)
		__scaling__.addSubview(menino__root)
		viewsByName["Menino__root"] = menino__root
		viewsByName["Menino__xScale"] = menino__xScale
		viewsByName["Menino__yScale"] = menino__yScale
		viewsByName["Menino"] = menino

		let leoFalando__root = Storytelling2PassthroughView()
		let leoFalando__xScale = Storytelling2PassthroughView()
		let leoFalando__yScale = Storytelling2PassthroughView()
		let leoFalando = UIImageView()
		let imgLeoFalando = UIImage(named:"Leo falando.png", in: bundle, compatibleWith: nil)
		if imgLeoFalando == nil {
			print("** Warning: Could not create image from 'Leo falando.png'")
		}
		leoFalando.image = imgLeoFalando
		leoFalando.contentMode = .center
		leoFalando.bounds = CGRect(x:0, y:0, width:170.0, height:179.0)
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

		let pontoDireitoEmCima__root = Storytelling2PassthroughView()
		let pontoDireitoEmCima__xScale = Storytelling2PassthroughView()
		let pontoDireitoEmCima__yScale = Storytelling2PassthroughView()
		let pontoDireitoEmCima = UIImageView()
		let imgPontoDireitoEmCima = UIImage(named:"Ponto direito em cima.png", in: bundle, compatibleWith: nil)
		if imgPontoDireitoEmCima == nil {
			print("** Warning: Could not create image from 'Ponto direito em cima.png'")
		}
		pontoDireitoEmCima.image = imgPontoDireitoEmCima
		pontoDireitoEmCima.contentMode = .center
		pontoDireitoEmCima.bounds = CGRect(x:0, y:0, width:27.0, height:46.0)
		pontoDireitoEmCima__root.layer.position = CGPoint(x:373.768, y:514.414)
		pontoDireitoEmCima__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		pontoDireitoEmCima__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		pontoDireitoEmCima__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(pontoDireitoEmCima__root)
		pontoDireitoEmCima__root.addSubview(pontoDireitoEmCima__xScale)
		pontoDireitoEmCima__xScale.addSubview(pontoDireitoEmCima__yScale)
		pontoDireitoEmCima__yScale.addSubview(pontoDireitoEmCima)
		__scaling__.addSubview(pontoDireitoEmCima__root)
		viewsByName["Ponto direito em cima__root"] = pontoDireitoEmCima__root
		viewsByName["Ponto direito em cima__xScale"] = pontoDireitoEmCima__xScale
		viewsByName["Ponto direito em cima__yScale"] = pontoDireitoEmCima__yScale
		viewsByName["Ponto direito em cima"] = pontoDireitoEmCima

		let pontoEsquerdaEmCima__root = Storytelling2PassthroughView()
		let pontoEsquerdaEmCima__xScale = Storytelling2PassthroughView()
		let pontoEsquerdaEmCima__yScale = Storytelling2PassthroughView()
		let pontoEsquerdaEmCima = UIImageView()
		let imgPontoEsquerdaEmCima = UIImage(named:"Ponto esquerda em cima.png", in: bundle, compatibleWith: nil)
		if imgPontoEsquerdaEmCima == nil {
			print("** Warning: Could not create image from 'Ponto esquerda em cima.png'")
		}
		pontoEsquerdaEmCima.image = imgPontoEsquerdaEmCima
		pontoEsquerdaEmCima.contentMode = .center
		pontoEsquerdaEmCima.bounds = CGRect(x:0, y:0, width:40.0, height:67.0)
		pontoEsquerdaEmCima__root.layer.position = CGPoint(x:421.682, y:393.818)
		pontoEsquerdaEmCima__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		pontoEsquerdaEmCima__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		pontoEsquerdaEmCima__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(pontoEsquerdaEmCima__root)
		pontoEsquerdaEmCima__root.addSubview(pontoEsquerdaEmCima__xScale)
		pontoEsquerdaEmCima__xScale.addSubview(pontoEsquerdaEmCima__yScale)
		pontoEsquerdaEmCima__yScale.addSubview(pontoEsquerdaEmCima)
		__scaling__.addSubview(pontoEsquerdaEmCima__root)
		viewsByName["Ponto esquerda em cima__root"] = pontoEsquerdaEmCima__root
		viewsByName["Ponto esquerda em cima__xScale"] = pontoEsquerdaEmCima__xScale
		viewsByName["Ponto esquerda em cima__yScale"] = pontoEsquerdaEmCima__yScale
		viewsByName["Ponto esquerda em cima"] = pontoEsquerdaEmCima

		let pontoEsquerdaEmbaixo__root = Storytelling2PassthroughView()
		let pontoEsquerdaEmbaixo__xScale = Storytelling2PassthroughView()
		let pontoEsquerdaEmbaixo__yScale = Storytelling2PassthroughView()
		let pontoEsquerdaEmbaixo = UIImageView()
		let imgPontoEsquerdaEmbaixo = UIImage(named:"Ponto esquerda embaixo.png", in: bundle, compatibleWith: nil)
		if imgPontoEsquerdaEmbaixo == nil {
			print("** Warning: Could not create image from 'Ponto esquerda embaixo.png'")
		}
		pontoEsquerdaEmbaixo.image = imgPontoEsquerdaEmbaixo
		pontoEsquerdaEmbaixo.contentMode = .center
		pontoEsquerdaEmbaixo.bounds = CGRect(x:0, y:0, width:28.0, height:46.0)
		pontoEsquerdaEmbaixo__root.layer.position = CGPoint(x:626.229, y:384.000)
		pontoEsquerdaEmbaixo__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		pontoEsquerdaEmbaixo__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		pontoEsquerdaEmbaixo__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(pontoEsquerdaEmbaixo__root)
		pontoEsquerdaEmbaixo__root.addSubview(pontoEsquerdaEmbaixo__xScale)
		pontoEsquerdaEmbaixo__xScale.addSubview(pontoEsquerdaEmbaixo__yScale)
		pontoEsquerdaEmbaixo__yScale.addSubview(pontoEsquerdaEmbaixo)
		__scaling__.addSubview(pontoEsquerdaEmbaixo__root)
		viewsByName["Ponto esquerda embaixo__root"] = pontoEsquerdaEmbaixo__root
		viewsByName["Ponto esquerda embaixo__xScale"] = pontoEsquerdaEmbaixo__xScale
		viewsByName["Ponto esquerda embaixo__yScale"] = pontoEsquerdaEmbaixo__yScale
		viewsByName["Ponto esquerda embaixo"] = pontoEsquerdaEmbaixo

		let pontoDireitoAbaixo__root = Storytelling2PassthroughView()
		let pontoDireitoAbaixo__xScale = Storytelling2PassthroughView()
		let pontoDireitoAbaixo__yScale = Storytelling2PassthroughView()
		let pontoDireitoAbaixo = UIImageView()
		let imgPontoDireitoAbaixo = UIImage(named:"Ponto direito abaixo.png", in: bundle, compatibleWith: nil)
		if imgPontoDireitoAbaixo == nil {
			print("** Warning: Could not create image from 'Ponto direito abaixo.png'")
		}
		pontoDireitoAbaixo.image = imgPontoDireitoAbaixo
		pontoDireitoAbaixo.contentMode = .center
		pontoDireitoAbaixo.bounds = CGRect(x:0, y:0, width:50.0, height:83.0)
		pontoDireitoAbaixo__root.layer.position = CGPoint(x:654.888, y:502.305)
		pontoDireitoAbaixo__xScale.transform = CGAffineTransform(scaleX: 0.00, y: 1.00)
		pontoDireitoAbaixo__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.00)
		pontoDireitoAbaixo__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(pontoDireitoAbaixo__root)
		pontoDireitoAbaixo__root.addSubview(pontoDireitoAbaixo__xScale)
		pontoDireitoAbaixo__xScale.addSubview(pontoDireitoAbaixo__yScale)
		pontoDireitoAbaixo__yScale.addSubview(pontoDireitoAbaixo)
		__scaling__.addSubview(pontoDireitoAbaixo__root)
		viewsByName["Ponto direito abaixo__root"] = pontoDireitoAbaixo__root
		viewsByName["Ponto direito abaixo__xScale"] = pontoDireitoAbaixo__xScale
		viewsByName["Ponto direito abaixo__yScale"] = pontoDireitoAbaixo__yScale
		viewsByName["Ponto direito abaixo"] = pontoDireitoAbaixo

		let arrow__root = Storytelling2PassthroughView()
		let arrow__xScale = Storytelling2PassthroughView()
		let arrow__yScale = Storytelling2PassthroughView()
		let arrow = UIImageView()
		arrow.image = imgArrow
		arrow.contentMode = .center
		arrow.bounds = CGRect(x:0, y:0, width:56.0, height:16.0)
		arrow__root.layer.position = CGPoint(x:1052.823, y:672.536)
		arrow__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		arrow__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		arrow__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(arrow__root)
		arrow__root.addSubview(arrow__xScale)
		arrow__xScale.addSubview(arrow__yScale)
		arrow__yScale.addSubview(arrow)
		__scaling__.addSubview(arrow__root)
		viewsByName["arrow__root"] = arrow__root
		viewsByName["arrow__xScale"] = arrow__xScale
		viewsByName["arrow__yScale"] = arrow__yScale
		viewsByName["arrow"] = arrow

		self.viewsByName = viewsByName
	}

	// - MARK: story2

	func addStory2Animation() {
		addStory2Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addStory2Animation(completion: ((Bool) -> Void)?) {
		addStory2Animation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addStory2Animation(removedOnCompletion: Bool) {
		addStory2Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addStory2Animation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addStory2Animation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addStory2Animation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		let instantTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 11.100
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Story2")
			self.animationCompletions[layer.animation(forKey: "Story2")!] = complete
		}

		let movementMaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		movementMaskTranslationXAnimation.duration = 11.100
		movementMaskTranslationXAnimation.values = [0.000, 0.000, -65.000] as [Float]
		movementMaskTranslationXAnimation.keyTimes = [0.000, 0.946, 1.000] as [NSNumber]
		movementMaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming]
		movementMaskTranslationXAnimation.beginTime = beginTime
		movementMaskTranslationXAnimation.fillMode = fillMode
		movementMaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Movement_mask__root"]?.layer.add(movementMaskTranslationXAnimation, forKey:"story2_TranslationX")

		let movementMaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		movementMaskTranslationYAnimation.duration = 11.100
		movementMaskTranslationYAnimation.values = [0.000, 0.000, 0.000] as [Float]
		movementMaskTranslationYAnimation.keyTimes = [0.000, 0.946, 1.000] as [NSNumber]
		movementMaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		movementMaskTranslationYAnimation.beginTime = beginTime
		movementMaskTranslationYAnimation.fillMode = fillMode
		movementMaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Movement_mask__root"]?.layer.add(movementMaskTranslationYAnimation, forKey:"story2_TranslationY")

		let handScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		handScaleXAnimation.duration = 11.100
		handScaleXAnimation.values = [0.000, 0.000, 1.000, 1.000] as [Float]
		handScaleXAnimation.keyTimes = [0.000, 0.914, 0.946, 1.000] as [NSNumber]
		handScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		handScaleXAnimation.beginTime = beginTime
		handScaleXAnimation.fillMode = fillMode
		handScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["hand__xScale"]?.layer.add(handScaleXAnimation, forKey:"story2_ScaleX")

		let handScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		handScaleYAnimation.duration = 11.100
		handScaleYAnimation.values = [0.000, 0.000, 1.000, 1.000] as [Float]
		handScaleYAnimation.keyTimes = [0.000, 0.914, 0.946, 1.000] as [NSNumber]
		handScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		handScaleYAnimation.beginTime = beginTime
		handScaleYAnimation.fillMode = fillMode
		handScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["hand__yScale"]?.layer.add(handScaleYAnimation, forKey:"story2_ScaleY")

		let handTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		handTranslationXAnimation.duration = 11.100
		handTranslationXAnimation.values = [0.000, 0.000, -70.000, -70.000] as [Float]
		handTranslationXAnimation.keyTimes = [0.000, 0.959, 0.993, 1.000] as [NSNumber]
		handTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		handTranslationXAnimation.beginTime = beginTime
		handTranslationXAnimation.fillMode = fillMode
		handTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["hand__root"]?.layer.add(handTranslationXAnimation, forKey:"story2_TranslationX")

		let handTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		handTranslationYAnimation.duration = 11.100
		handTranslationYAnimation.values = [0.000, 0.000, 0.000] as [Float]
		handTranslationYAnimation.keyTimes = [0.000, 0.959, 1.000] as [NSNumber]
		handTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		handTranslationYAnimation.beginTime = beginTime
		handTranslationYAnimation.fillMode = fillMode
		handTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["hand__root"]?.layer.add(handTranslationYAnimation, forKey:"story2_TranslationY")

		let pontoEsquerdaEmCimaScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		pontoEsquerdaEmCimaScaleXAnimation.duration = 11.100
		pontoEsquerdaEmCimaScaleXAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoEsquerdaEmCimaScaleXAnimation.keyTimes = [0.000, 0.450, 0.468, 0.480, 0.491, 1.000] as [NSNumber]
		pontoEsquerdaEmCimaScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoEsquerdaEmCimaScaleXAnimation.beginTime = beginTime
		pontoEsquerdaEmCimaScaleXAnimation.fillMode = fillMode
		pontoEsquerdaEmCimaScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto esquerda em cima__xScale"]?.layer.add(pontoEsquerdaEmCimaScaleXAnimation, forKey:"story2_ScaleX")

		let pontoEsquerdaEmCimaScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		pontoEsquerdaEmCimaScaleYAnimation.duration = 11.100
		pontoEsquerdaEmCimaScaleYAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoEsquerdaEmCimaScaleYAnimation.keyTimes = [0.000, 0.450, 0.468, 0.480, 0.491, 1.000] as [NSNumber]
		pontoEsquerdaEmCimaScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoEsquerdaEmCimaScaleYAnimation.beginTime = beginTime
		pontoEsquerdaEmCimaScaleYAnimation.fillMode = fillMode
		pontoEsquerdaEmCimaScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto esquerda em cima__yScale"]?.layer.add(pontoEsquerdaEmCimaScaleYAnimation, forKey:"story2_ScaleY")

		let pontoDireitoAbaixoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		pontoDireitoAbaixoScaleXAnimation.duration = 11.100
		pontoDireitoAbaixoScaleXAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoDireitoAbaixoScaleXAnimation.keyTimes = [0.000, 0.532, 0.552, 0.561, 0.572, 1.000] as [NSNumber]
		pontoDireitoAbaixoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoDireitoAbaixoScaleXAnimation.beginTime = beginTime
		pontoDireitoAbaixoScaleXAnimation.fillMode = fillMode
		pontoDireitoAbaixoScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto direito abaixo__xScale"]?.layer.add(pontoDireitoAbaixoScaleXAnimation, forKey:"story2_ScaleX")

		let pontoDireitoAbaixoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		pontoDireitoAbaixoScaleYAnimation.duration = 11.100
		pontoDireitoAbaixoScaleYAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoDireitoAbaixoScaleYAnimation.keyTimes = [0.000, 0.532, 0.552, 0.561, 0.572, 1.000] as [NSNumber]
		pontoDireitoAbaixoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoDireitoAbaixoScaleYAnimation.beginTime = beginTime
		pontoDireitoAbaixoScaleYAnimation.fillMode = fillMode
		pontoDireitoAbaixoScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto direito abaixo__yScale"]?.layer.add(pontoDireitoAbaixoScaleYAnimation, forKey:"story2_ScaleY")

		let fala2MaskScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		fala2MaskScaleXAnimation.duration = 11.100
		fala2MaskScaleXAnimation.values = [1.712, 1.712, 1.712] as [Float]
		fala2MaskScaleXAnimation.keyTimes = [0.000, 0.077, 1.000] as [NSNumber]
		fala2MaskScaleXAnimation.timingFunctions = [linearTiming, linearTiming]
		fala2MaskScaleXAnimation.beginTime = beginTime
		fala2MaskScaleXAnimation.fillMode = fillMode
		fala2MaskScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala2_mask__xScale"]?.layer.add(fala2MaskScaleXAnimation, forKey:"story2_ScaleX")

		let fala2MaskScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		fala2MaskScaleYAnimation.duration = 11.100
		fala2MaskScaleYAnimation.values = [16.765, 16.765, 16.765, 28.454, 28.454] as [Float]
		fala2MaskScaleYAnimation.keyTimes = [0.000, 0.077, 0.077, 0.090, 1.000] as [NSNumber]
		fala2MaskScaleYAnimation.timingFunctions = [instantTiming, instantTiming, linearTiming, linearTiming]
		fala2MaskScaleYAnimation.beginTime = beginTime
		fala2MaskScaleYAnimation.fillMode = fillMode
		fala2MaskScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala2_mask__yScale"]?.layer.add(fala2MaskScaleYAnimation, forKey:"story2_ScaleY")

		let fala2MaskTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		fala2MaskTranslationXAnimation.duration = 11.100
		fala2MaskTranslationXAnimation.values = [0.000, 0.000, 1405.000, 1405.000] as [Float]
		fala2MaskTranslationXAnimation.keyTimes = [0.000, 0.036, 0.090, 1.000] as [NSNumber]
		fala2MaskTranslationXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		fala2MaskTranslationXAnimation.beginTime = beginTime
		fala2MaskTranslationXAnimation.fillMode = fillMode
		fala2MaskTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala2_mask__root"]?.layer.add(fala2MaskTranslationXAnimation, forKey:"story2_TranslationX")

		let fala2MaskTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		fala2MaskTranslationYAnimation.duration = 11.100
		fala2MaskTranslationYAnimation.values = [0.000, 0.000, 0.000] as [Float]
		fala2MaskTranslationYAnimation.keyTimes = [0.000, 0.036, 1.000] as [NSNumber]
		fala2MaskTranslationYAnimation.timingFunctions = [linearTiming, linearTiming]
		fala2MaskTranslationYAnimation.beginTime = beginTime
		fala2MaskTranslationYAnimation.fillMode = fillMode
		fala2MaskTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Fala2_mask__root"]?.layer.add(fala2MaskTranslationYAnimation, forKey:"story2_TranslationY")

		let pontoEsquerdaEmbaixoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		pontoEsquerdaEmbaixoScaleXAnimation.duration = 11.100
		pontoEsquerdaEmbaixoScaleXAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoEsquerdaEmbaixoScaleXAnimation.keyTimes = [0.000, 0.484, 0.500, 0.509, 0.518, 1.000] as [NSNumber]
		pontoEsquerdaEmbaixoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoEsquerdaEmbaixoScaleXAnimation.beginTime = beginTime
		pontoEsquerdaEmbaixoScaleXAnimation.fillMode = fillMode
		pontoEsquerdaEmbaixoScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto esquerda embaixo__xScale"]?.layer.add(pontoEsquerdaEmbaixoScaleXAnimation, forKey:"story2_ScaleX")

		let pontoEsquerdaEmbaixoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		pontoEsquerdaEmbaixoScaleYAnimation.duration = 11.100
		pontoEsquerdaEmbaixoScaleYAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoEsquerdaEmbaixoScaleYAnimation.keyTimes = [0.000, 0.484, 0.500, 0.509, 0.518, 1.000] as [NSNumber]
		pontoEsquerdaEmbaixoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoEsquerdaEmbaixoScaleYAnimation.beginTime = beginTime
		pontoEsquerdaEmbaixoScaleYAnimation.fillMode = fillMode
		pontoEsquerdaEmbaixoScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto esquerda embaixo__yScale"]?.layer.add(pontoEsquerdaEmbaixoScaleYAnimation, forKey:"story2_ScaleY")

		let leoFalandoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		leoFalandoScaleXAnimation.duration = 11.100
		leoFalandoScaleXAnimation.values = [0.000, 0.800, 0.700, 0.700] as [Float]
		leoFalandoScaleXAnimation.keyTimes = [0.000, 0.027, 0.036, 1.000] as [NSNumber]
		leoFalandoScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleXAnimation.beginTime = beginTime
		leoFalandoScaleXAnimation.fillMode = fillMode
		leoFalandoScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando__xScale"]?.layer.add(leoFalandoScaleXAnimation, forKey:"story2_ScaleX")

		let leoFalandoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		leoFalandoScaleYAnimation.duration = 11.100
		leoFalandoScaleYAnimation.values = [0.000, 0.800, 0.700, 0.700] as [Float]
		leoFalandoScaleYAnimation.keyTimes = [0.000, 0.027, 0.036, 1.000] as [NSNumber]
		leoFalandoScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming]
		leoFalandoScaleYAnimation.beginTime = beginTime
		leoFalandoScaleYAnimation.fillMode = fillMode
		leoFalandoScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Leo falando__yScale"]?.layer.add(leoFalandoScaleYAnimation, forKey:"story2_ScaleY")

		let pontoDireitoEmCimaScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
		pontoDireitoEmCimaScaleXAnimation.duration = 11.100
		pontoDireitoEmCimaScaleXAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoDireitoEmCimaScaleXAnimation.keyTimes = [0.000, 0.511, 0.529, 0.541, 0.552, 1.000] as [NSNumber]
		pontoDireitoEmCimaScaleXAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoDireitoEmCimaScaleXAnimation.beginTime = beginTime
		pontoDireitoEmCimaScaleXAnimation.fillMode = fillMode
		pontoDireitoEmCimaScaleXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto direito em cima__xScale"]?.layer.add(pontoDireitoEmCimaScaleXAnimation, forKey:"story2_ScaleX")

		let pontoDireitoEmCimaScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
		pontoDireitoEmCimaScaleYAnimation.duration = 11.100
		pontoDireitoEmCimaScaleYAnimation.values = [0.000, 0.000, 1.100, 0.900, 1.000, 1.000] as [Float]
		pontoDireitoEmCimaScaleYAnimation.keyTimes = [0.000, 0.511, 0.529, 0.541, 0.552, 1.000] as [NSNumber]
		pontoDireitoEmCimaScaleYAnimation.timingFunctions = [linearTiming, linearTiming, linearTiming, linearTiming, linearTiming]
		pontoDireitoEmCimaScaleYAnimation.beginTime = beginTime
		pontoDireitoEmCimaScaleYAnimation.fillMode = fillMode
		pontoDireitoEmCimaScaleYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Ponto direito em cima__yScale"]?.layer.add(pontoDireitoEmCimaScaleYAnimation, forKey:"story2_ScaleY")
	}

	func removeStory2Animation() {
		self.layer.removeAnimation(forKey: "Story2")
		self.viewsByName["Movement_mask__root"]?.layer.removeAnimation(forKey: "story2_TranslationX")
		self.viewsByName["Movement_mask__root"]?.layer.removeAnimation(forKey: "story2_TranslationY")
		self.viewsByName["hand__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["hand__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["hand__root"]?.layer.removeAnimation(forKey: "story2_TranslationX")
		self.viewsByName["hand__root"]?.layer.removeAnimation(forKey: "story2_TranslationY")
		self.viewsByName["Ponto esquerda em cima__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Ponto esquerda em cima__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["Ponto direito abaixo__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Ponto direito abaixo__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["Fala2_mask__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Fala2_mask__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["Fala2_mask__root"]?.layer.removeAnimation(forKey: "story2_TranslationX")
		self.viewsByName["Fala2_mask__root"]?.layer.removeAnimation(forKey: "story2_TranslationY")
		self.viewsByName["Ponto esquerda embaixo__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Ponto esquerda embaixo__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["Leo falando__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Leo falando__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
		self.viewsByName["Ponto direito em cima__xScale"]?.layer.removeAnimation(forKey: "story2_ScaleX")
		self.viewsByName["Ponto direito em cima__yScale"]?.layer.removeAnimation(forKey: "story2_ScaleY")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "Story2")
	}
}