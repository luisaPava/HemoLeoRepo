//
// MeninoDorView.swift
// Generated by Core Animator version 1.3.2 on 21/11/16.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//
import Foundation
import UIKit

protocol MeninoDorViewDelegate: class {
	func botãoDesativado(botãoDesativado: UIButton)

}

private class MeninoDorPassthroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
class MeninoDorView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 414, height: 736))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	weak var meninoDorViewDelegate: MeninoDorViewDelegate?

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
		__scaling__.bounds = CGRect(x:0, y:0, width:414, height:736)
		__scaling__.center = CGPoint(x:207.0, y:368.0)
		__scaling__.layer.masksToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let menino__root = MeninoDorPassthroughView()
		let menino__xScale = MeninoDorPassthroughView()
		let menino__yScale = MeninoDorPassthroughView()
		let menino = UIImageView()
		let imgMenino = UIImage(named:"Menino.png", in: bundle, compatibleWith: nil)
		if imgMenino == nil {
			print("** Warning: Could not create image from 'Menino.png'")
		}
		menino.image = imgMenino
		menino.contentMode = .center
		menino.bounds = CGRect(x:0, y:0, width:294.0, height:992.0)
		menino__root.layer.position = CGPoint(x:207.000, y:368.000)
		menino__xScale.transform = CGAffineTransform(scaleX: 0.68, y: 1.00)
		menino__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.68)
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

		let botãoDesativadoDorOD__root = MeninoDorPassthroughView()
		let botãoDesativadoDorOD__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorOD__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorOD = UIButton(type: .custom)
		let imgBotãoDesativadoDor = UIImage(named:"BotãoDesativadoDor.png", in: bundle, compatibleWith: nil)
        let imgAtivado = #imageLiteral(resourceName: "BotãoAtivoDor")
        
		if imgBotãoDesativadoDor == nil {
			print("** Warning: Could not create image from 'BotãoDesativadoDor.png'")
		}
        botãoDesativadoDorOD.accessibilityIdentifier = "Ombro Direito"
        botãoDesativadoDorOD.tag = 0
		botãoDesativadoDorOD.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorOD.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorOD.contentMode = .center
		botãoDesativadoDorOD.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorOD__root.layer.position = CGPoint(x:273.299, y:190.000)
		botãoDesativadoDorOD__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorOD__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorOD__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorOD.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorODPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorOD__root)
		botãoDesativadoDorOD__root.addSubview(botãoDesativadoDorOD__xScale)
		botãoDesativadoDorOD__xScale.addSubview(botãoDesativadoDorOD__yScale)
		botãoDesativadoDorOD__yScale.addSubview(botãoDesativadoDorOD)
		__scaling__.addSubview(botãoDesativadoDorOD__root)
		viewsByName["BotãoDesativadoDorOD__root"] = botãoDesativadoDorOD__root
		viewsByName["BotãoDesativadoDorOD__xScale"] = botãoDesativadoDorOD__xScale
		viewsByName["BotãoDesativadoDorOD__yScale"] = botãoDesativadoDorOD__yScale
		viewsByName["BotãoDesativadoDorOD"] = botãoDesativadoDorOD

		let botãoDesativadoDorJD__root = MeninoDorPassthroughView()
		let botãoDesativadoDorJD__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorJD__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorJD = UIButton(type: .custom)
        
        botãoDesativadoDorJD.accessibilityIdentifier = "Joelho Direito"
        botãoDesativadoDorJD.tag = 1
		botãoDesativadoDorJD.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorJD.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorJD.contentMode = .center
		botãoDesativadoDorJD.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorJD__root.layer.position = CGPoint(x:243.982, y:540.000)
		botãoDesativadoDorJD__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorJD__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorJD__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorJD.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorJDPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorJD__root)
		botãoDesativadoDorJD__root.addSubview(botãoDesativadoDorJD__xScale)
		botãoDesativadoDorJD__xScale.addSubview(botãoDesativadoDorJD__yScale)
		botãoDesativadoDorJD__yScale.addSubview(botãoDesativadoDorJD)
		__scaling__.addSubview(botãoDesativadoDorJD__root)
		viewsByName["BotãoDesativadoDorJD__root"] = botãoDesativadoDorJD__root
		viewsByName["BotãoDesativadoDorJD__xScale"] = botãoDesativadoDorJD__xScale
		viewsByName["BotãoDesativadoDorJD__yScale"] = botãoDesativadoDorJD__yScale
		viewsByName["BotãoDesativadoDorJD"] = botãoDesativadoDorJD

		let botãoDesativadoDorTD__root = MeninoDorPassthroughView()
		let botãoDesativadoDorTD__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorTD__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorTD = UIButton(type: .custom)
        
        botãoDesativadoDorTD.accessibilityIdentifier = "Tornozelo Direito"
        botãoDesativadoDorTD.tag = 2
		botãoDesativadoDorTD.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorTD.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorTD.contentMode = .center
		botãoDesativadoDorTD.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorTD__root.layer.position = CGPoint(x:242.911, y:670.000)
		botãoDesativadoDorTD__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorTD__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorTD__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorTD.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorTDPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorTD__root)
		botãoDesativadoDorTD__root.addSubview(botãoDesativadoDorTD__xScale)
		botãoDesativadoDorTD__xScale.addSubview(botãoDesativadoDorTD__yScale)
		botãoDesativadoDorTD__yScale.addSubview(botãoDesativadoDorTD)
		__scaling__.addSubview(botãoDesativadoDorTD__root)
		viewsByName["BotãoDesativadoDorTD__root"] = botãoDesativadoDorTD__root
		viewsByName["BotãoDesativadoDorTD__xScale"] = botãoDesativadoDorTD__xScale
		viewsByName["BotãoDesativadoDorTD__yScale"] = botãoDesativadoDorTD__yScale
		viewsByName["BotãoDesativadoDorTD"] = botãoDesativadoDorTD

		let botãoDesativadoDorTE__root = MeninoDorPassthroughView()
		let botãoDesativadoDorTE__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorTE__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorTE = UIButton(type: .custom)
        
        botãoDesativadoDorTE.accessibilityIdentifier = "Tornozelo Esquerdo"
        botãoDesativadoDorTE.tag = 3
		botãoDesativadoDorTE.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorTE.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorTE.contentMode = .center
		botãoDesativadoDorTE.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorTE__root.layer.position = CGPoint(x:169.414, y:670.000)
		botãoDesativadoDorTE__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorTE__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorTE__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorTE.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorTEPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorTE__root)
		botãoDesativadoDorTE__root.addSubview(botãoDesativadoDorTE__xScale)
		botãoDesativadoDorTE__xScale.addSubview(botãoDesativadoDorTE__yScale)
		botãoDesativadoDorTE__yScale.addSubview(botãoDesativadoDorTE)
		__scaling__.addSubview(botãoDesativadoDorTE__root)
		viewsByName["BotãoDesativadoDorTE__root"] = botãoDesativadoDorTE__root
		viewsByName["BotãoDesativadoDorTE__xScale"] = botãoDesativadoDorTE__xScale
		viewsByName["BotãoDesativadoDorTE__yScale"] = botãoDesativadoDorTE__yScale
		viewsByName["BotãoDesativadoDorTE"] = botãoDesativadoDorTE

		let botãoDesativadoDorJE__root = MeninoDorPassthroughView()
		let botãoDesativadoDorJE__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorJE__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorJE = UIButton(type: .custom)
        
        botãoDesativadoDorJE.accessibilityIdentifier = "Joelho Esquerdo"
        botãoDesativadoDorJE.tag = 4
		botãoDesativadoDorJE.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorJE.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorJE.contentMode = .center
		botãoDesativadoDorJE.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorJE__root.layer.position = CGPoint(x:169.625, y:540.000)
		botãoDesativadoDorJE__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorJE__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorJE__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorJE.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorJEPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorJE__root)
		botãoDesativadoDorJE__root.addSubview(botãoDesativadoDorJE__xScale)
		botãoDesativadoDorJE__xScale.addSubview(botãoDesativadoDorJE__yScale)
		botãoDesativadoDorJE__yScale.addSubview(botãoDesativadoDorJE)
		__scaling__.addSubview(botãoDesativadoDorJE__root)
		viewsByName["BotãoDesativadoDorJE__root"] = botãoDesativadoDorJE__root
		viewsByName["BotãoDesativadoDorJE__xScale"] = botãoDesativadoDorJE__xScale
		viewsByName["BotãoDesativadoDorJE__yScale"] = botãoDesativadoDorJE__yScale
		viewsByName["BotãoDesativadoDorJE"] = botãoDesativadoDorJE

		let botãoDesativadoDorQD__root = MeninoDorPassthroughView()
		let botãoDesativadoDorQD__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorQD__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorQD = UIButton(type: .custom)
        
        botãoDesativadoDorQD.accessibilityIdentifier = "Quadril Direito"
        botãoDesativadoDorQD.tag = 5
		botãoDesativadoDorQD.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorQD.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorQD.contentMode = .center
		botãoDesativadoDorQD.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorQD__root.layer.position = CGPoint(x:242.336, y:430.086)
		botãoDesativadoDorQD__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorQD__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorQD__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorQD.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorQDPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorQD__root)
		botãoDesativadoDorQD__root.addSubview(botãoDesativadoDorQD__xScale)
		botãoDesativadoDorQD__xScale.addSubview(botãoDesativadoDorQD__yScale)
		botãoDesativadoDorQD__yScale.addSubview(botãoDesativadoDorQD)
		__scaling__.addSubview(botãoDesativadoDorQD__root)
		viewsByName["BotãoDesativadoDorQD__root"] = botãoDesativadoDorQD__root
		viewsByName["BotãoDesativadoDorQD__xScale"] = botãoDesativadoDorQD__xScale
		viewsByName["BotãoDesativadoDorQD__yScale"] = botãoDesativadoDorQD__yScale
		viewsByName["BotãoDesativadoDorQD"] = botãoDesativadoDorQD

		let botãoDesativadoDorQE__root = MeninoDorPassthroughView()
		let botãoDesativadoDorQE__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorQE__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorQE = UIButton(type: .custom)
        
        botãoDesativadoDorQE.accessibilityIdentifier = "Quadril Esquerdo"
        botãoDesativadoDorQE.tag = 6
		botãoDesativadoDorQE.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorQE.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorQE.contentMode = .center
		botãoDesativadoDorQE.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorQE__root.layer.position = CGPoint(x:173.497, y:430.000)
		botãoDesativadoDorQE__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorQE__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorQE__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorQE.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorQEPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorQE__root)
		botãoDesativadoDorQE__root.addSubview(botãoDesativadoDorQE__xScale)
		botãoDesativadoDorQE__xScale.addSubview(botãoDesativadoDorQE__yScale)
		botãoDesativadoDorQE__yScale.addSubview(botãoDesativadoDorQE)
		__scaling__.addSubview(botãoDesativadoDorQE__root)
		viewsByName["BotãoDesativadoDorQE__root"] = botãoDesativadoDorQE__root
		viewsByName["BotãoDesativadoDorQE__xScale"] = botãoDesativadoDorQE__xScale
		viewsByName["BotãoDesativadoDorQE__yScale"] = botãoDesativadoDorQE__yScale
		viewsByName["BotãoDesativadoDorQE"] = botãoDesativadoDorQE

		let botãoDesativadoDorCD__root = MeninoDorPassthroughView()
		let botãoDesativadoDorCD__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorCD__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorCD = UIButton(type: .custom)
        
        botãoDesativadoDorCD.accessibilityIdentifier = "Cotovelo Direito"
        botãoDesativadoDorCD.tag = 7
		botãoDesativadoDorCD.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorCD.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorCD.contentMode = .center
		botãoDesativadoDorCD.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorCD__root.layer.position = CGPoint(x:280.000, y:300.000)
		botãoDesativadoDorCD__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorCD__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorCD__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorCD.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorCDPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorCD__root)
		botãoDesativadoDorCD__root.addSubview(botãoDesativadoDorCD__xScale)
		botãoDesativadoDorCD__xScale.addSubview(botãoDesativadoDorCD__yScale)
		botãoDesativadoDorCD__yScale.addSubview(botãoDesativadoDorCD)
		__scaling__.addSubview(botãoDesativadoDorCD__root)
		viewsByName["BotãoDesativadoDorCD__root"] = botãoDesativadoDorCD__root
		viewsByName["BotãoDesativadoDorCD__xScale"] = botãoDesativadoDorCD__xScale
		viewsByName["BotãoDesativadoDorCD__yScale"] = botãoDesativadoDorCD__yScale
		viewsByName["BotãoDesativadoDorCD"] = botãoDesativadoDorCD

		let botãoDesativadoDorCE__root = MeninoDorPassthroughView()
		let botãoDesativadoDorCE__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorCE__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorCE = UIButton(type: .custom)
        
        botãoDesativadoDorCE.accessibilityIdentifier = "Cotovelo Esquerdo"
        botãoDesativadoDorCE.tag = 8
		botãoDesativadoDorCE.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorCE.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorCE.contentMode = .center
		botãoDesativadoDorCE.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorCE__root.layer.position = CGPoint(x:133.815, y:300.000)
		botãoDesativadoDorCE__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorCE__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorCE__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorCE.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorCEPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorCE__root)
		botãoDesativadoDorCE__root.addSubview(botãoDesativadoDorCE__xScale)
		botãoDesativadoDorCE__xScale.addSubview(botãoDesativadoDorCE__yScale)
		botãoDesativadoDorCE__yScale.addSubview(botãoDesativadoDorCE)
		__scaling__.addSubview(botãoDesativadoDorCE__root)
		viewsByName["BotãoDesativadoDorCE__root"] = botãoDesativadoDorCE__root
		viewsByName["BotãoDesativadoDorCE__xScale"] = botãoDesativadoDorCE__xScale
		viewsByName["BotãoDesativadoDorCE__yScale"] = botãoDesativadoDorCE__yScale
		viewsByName["BotãoDesativadoDorCE"] = botãoDesativadoDorCE

		let botãoDesativadoDorOE__root = MeninoDorPassthroughView()
		let botãoDesativadoDorOE__xScale = MeninoDorPassthroughView()
		let botãoDesativadoDorOE__yScale = MeninoDorPassthroughView()
		let botãoDesativadoDorOE = UIButton(type: .custom)
        
        botãoDesativadoDorOE.accessibilityIdentifier = "Ombro Esquerdo"
        botãoDesativadoDorOE.tag = 9
		botãoDesativadoDorOE.setBackgroundImage(imgBotãoDesativadoDor, for:.normal)
        botãoDesativadoDorOE.setBackgroundImage(imgAtivado, for:.selected)
		botãoDesativadoDorOE.contentMode = .center
		botãoDesativadoDorOE.bounds = CGRect(x:0, y:0, width:44.0, height:44.0)
		botãoDesativadoDorOE__root.layer.position = CGPoint(x:139.753, y:190.000)
		botãoDesativadoDorOE__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorOE__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		botãoDesativadoDorOE__root.transform = CGAffineTransform(rotationAngle: 0.000)
		botãoDesativadoDorOE.addTarget(self, action:#selector(MeninoDorView.actionBotãoDesativadoDorOEPressed), for: .touchUpInside)
		__scaling__.addSubview(botãoDesativadoDorOE__root)
		botãoDesativadoDorOE__root.addSubview(botãoDesativadoDorOE__xScale)
		botãoDesativadoDorOE__xScale.addSubview(botãoDesativadoDorOE__yScale)
		botãoDesativadoDorOE__yScale.addSubview(botãoDesativadoDorOE)
		__scaling__.addSubview(botãoDesativadoDorOE__root)
		viewsByName["BotãoDesativadoDorOE__root"] = botãoDesativadoDorOE__root
		viewsByName["BotãoDesativadoDorOE__xScale"] = botãoDesativadoDorOE__xScale
		viewsByName["BotãoDesativadoDorOE__yScale"] = botãoDesativadoDorOE__yScale
		viewsByName["BotãoDesativadoDorOE"] = botãoDesativadoDorOE

		self.viewsByName = viewsByName
	}

	// - MARK: switchMaskToLeft

	func addSwitchMaskToLeftAnimation() {
		addSwitchMaskToLeftAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addSwitchMaskToLeftAnimation(completion: ((Bool) -> Void)?) {
		addSwitchMaskToLeftAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addSwitchMaskToLeftAnimation(removedOnCompletion: Bool) {
		addSwitchMaskToLeftAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addSwitchMaskToLeftAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addSwitchMaskToLeftAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addSwitchMaskToLeftAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 0.000
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "SwitchMaskToLeft")
			self.animationCompletions[layer.animation(forKey: "SwitchMaskToLeft")!] = complete
		}

		let mascaraTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		mascaraTranslationXAnimation.duration = 0.000
		mascaraTranslationXAnimation.values = [-205.229] as [Float]
		mascaraTranslationXAnimation.keyTimes = [0.000] as [NSNumber]
		mascaraTranslationXAnimation.beginTime = beginTime
		mascaraTranslationXAnimation.fillMode = fillMode
		mascaraTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mascara__root"]?.layer.add(mascaraTranslationXAnimation, forKey:"switchMaskToLeft_TranslationX")
	}

	func removeSwitchMaskToLeftAnimation() {
		self.layer.removeAnimation(forKey: "SwitchMaskToLeft")
		self.viewsByName["Mascara__root"]?.layer.removeAnimation(forKey: "switchMaskToLeft_TranslationX")
	}

	// - MARK: SwitchMaskToRight

	func addSwitchMaskToRightAnimation() {
		addSwitchMaskToRightAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addSwitchMaskToRightAnimation(completion: ((Bool) -> Void)?) {
		addSwitchMaskToRightAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addSwitchMaskToRightAnimation(removedOnCompletion: Bool) {
		addSwitchMaskToRightAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addSwitchMaskToRightAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addSwitchMaskToRightAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addSwitchMaskToRightAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 0.000
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "SwitchMaskToRight")
			self.animationCompletions[layer.animation(forKey: "SwitchMaskToRight")!] = complete
		}

		let mascaraTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		mascaraTranslationXAnimation.duration = 0.000
		mascaraTranslationXAnimation.values = [0.000] as [Float]
		mascaraTranslationXAnimation.keyTimes = [0.000] as [NSNumber]
		mascaraTranslationXAnimation.beginTime = beginTime
		mascaraTranslationXAnimation.fillMode = fillMode
		mascaraTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Mascara__root"]?.layer.add(mascaraTranslationXAnimation, forKey:"SwitchMaskToRight_TranslationX")
	}

	func removeSwitchMaskToRightAnimation() {
		self.layer.removeAnimation(forKey: "SwitchMaskToRight")
		self.viewsByName["Mascara__root"]?.layer.removeAnimation(forKey: "SwitchMaskToRight_TranslationX")
	}

	// MARK: CAAnimationDelegate
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

//	func removeAllAnimations() {
//		for subview in viewsByName.values {
//			subview.layer.removeAllAnimations()
//		}
//		self.layer.removeAnimation(forKey: "SwitchMaskToRight")
//		self.layer.removeAnimation(forKey: "SwitchMaskToLeft")
//	}

    func actionBotãoDesativadoDorODPressed(botãoDesativadoDorOD: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorOD)
    }
    
    func actionBotãoDesativadoDorJDPressed(botãoDesativadoDorJD: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorJD)
    }
    
    func actionBotãoDesativadoDorTDPressed(botãoDesativadoDorTD: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorTD)
    }
    
    func actionBotãoDesativadoDorTEPressed(botãoDesativadoDorTE: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorTE)
    }
    
    func actionBotãoDesativadoDorJEPressed(botãoDesativadoDorJE: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorJE)
    }
    
    func actionBotãoDesativadoDorQDPressed(botãoDesativadoDorQD: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorQD)
    }
    
    func actionBotãoDesativadoDorQEPressed(botãoDesativadoDorQE: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorQE)
    }
    
    func actionBotãoDesativadoDorCDPressed(botãoDesativadoDorCD: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorCD)
    }
    
    func actionBotãoDesativadoDorCEPressed(botãoDesativadoDorCE: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorCE)
    }
    
    func actionBotãoDesativadoDorOEPressed(botãoDesativadoDorOE: UIButton) {
        meninoDorViewDelegate?.botãoDesativado(botãoDesativado: botãoDesativadoDorOE)
    }
}
