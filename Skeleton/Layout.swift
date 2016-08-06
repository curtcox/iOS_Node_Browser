import UIKit

extension Controller {
    
    func addSubview(subview :UIView, below :UIView, by: CGFloat) {
        let frame = centerView(subview as! Sized, below:below, by:by)
        addSubviewAt(subview, frame:frame)
    }
    
    func addSubview(subview :UIView, above :UIView, by: CGFloat) {
        let frame = centerView(subview as! Sized, above:above, by:by)
        addSubviewAt(subview, frame:frame)
    }
    
    func addSubview(subview :UIView, toLeftOf :UIView, by: CGFloat) {
        let frame = toLeftOfView(subview as! Sized, viewOnRight:toLeftOf, by:by)
        addSubviewAt(subview, frame:frame)
    }
    
    func addSubview(subview :UIView, toRightOf :UIView, by: CGFloat) {
        let frame = toRightOfView(subview as! Sized, viewOnLeft:toRightOf, by:by)
        addSubviewAt(subview, frame:frame)
    }
    
    func addSubviewAt(subview :UIView, frame :CGRect) {
        subview.frame = frame
        view.addSubview(subview)
    }
    
    func centerView(subview: Sized, below: UIView, by: CGFloat) -> CGRect {
        let origin = CGPoint(x:centerX(subview), y:below.frame.maxY + by)
        return CGRect(origin:origin, size:subview.size)
    }
    
    func centerView(subview: Sized, above: UIView, by: CGFloat) -> CGRect {
        let origin = CGPoint(x:centerX(subview), y:above.frame.minY - subview.size.height - by)
        return CGRect(origin:origin, size:subview.size)
    }
    
    func toLeftOfView(subview: Sized, viewOnRight: UIView, by: CGFloat) -> CGRect {
        let origin = CGPoint(x:viewOnRight.frame.minX - subview.size.width - by, y:viewOnRight.frame.minY)
        return CGRect(origin:origin, size:subview.size)
    }
    
    func toRightOfView(subview: Sized, viewOnLeft: UIView, by: CGFloat) -> CGRect {
        let origin = CGPoint(x:viewOnLeft.frame.maxX + by, y:viewOnLeft.frame.minY)
        return CGRect(origin:origin, size:subview.size)
    }
    
    func left(frame :CGRect, by: CGFloat) -> CGRect {
        let size = frame.size
        let origin = CGPoint(x:frame.minX - by, y:frame.minY)
        return CGRect(origin:origin, size:size)
    }
    
    func right(frame :CGRect, by: CGFloat) -> CGRect {
        let size = frame.size
        let origin = CGPoint(x:frame.minX + by, y:frame.minY)
        return CGRect(origin:origin, size:size)
    }
    
    func up(frame :CGRect, by: CGFloat) -> CGRect {
        let size = frame.size
        let origin = CGPoint(x:frame.minX, y:frame.minY - by)
        return CGRect(origin:origin, size:size)
    }
    
    func down(frame :CGRect, by: CGFloat) -> CGRect {
        let size = frame.size
        let origin = CGPoint(x:frame.minX, y:frame.minY + by)
        return CGRect(origin:origin, size:size)
    }
    
    func upperLeft(sized: Sized) -> CGRect {
        let size = sized.size
        let origin = CGPoint(x:0, y:15)
        return CGRect(origin:origin, size:size)
    }
    
    func upperRight(sized: Sized) -> CGRect {
        let size = sized.size
        let origin = CGPoint(x:viewWidth() - size.width, y:15)
        return CGRect(origin:origin, size:size)
    }
    
    func lowerLeft(sized: Sized) -> CGRect {
        let size = sized.size
        let origin = CGPoint(x:20, y:viewHeight() - size.height - bottomMargin())
        return CGRect(origin:origin, size:size)
    }
    
    func lowerRight(sized: Sized) -> CGRect {
        let size = sized.size
        let origin = CGPoint(x:viewWidth() - size.width - 20, y:viewHeight() - size.height - bottomMargin())
        return CGRect(origin:origin, size:size)
    }
    
    func centerTop(sized: Sized) -> CGRect {
        let height = sized.size.height
        let width = sized.size.width
        let size = CGSize(width:width,height:height)
        let origin = CGPoint(x:centerX(sized), y:0)
        return CGRect(origin:origin, size:size)
    }
    
    func centerBottom(sized: Sized) -> CGRect {
        let height = sized.size.height
        let width = sized.size.width
        let size = CGSize(width:width,height:height)
        let origin = CGPoint(x:centerX(sized), y:viewHeight() - height - bottomMargin())
        return CGRect(origin:origin, size:size)
    }
    
    func centerBottomNoMargin(sized: Sized) -> CGRect {
        let height = sized.size.height
        let width = sized.size.width
        let size = CGSize(width:width,height:height)
        let origin = CGPoint(x:centerX(sized), y:viewHeight() - height)
        return CGRect(origin:origin, size:size)
    }
    
    func centerMiddle(sized: Sized) -> CGRect {
        let height = sized.size.height
        let width = sized.size.width
        let size = CGSize(width:width,height:height)
        let origin = CGPoint(x:centerX(sized), y:centerY(sized))
        return CGRect(origin:origin, size:size)
    }
    
    func bottomMargin() -> CGFloat {
        return 20
    }
    
    func topHalf() -> CGRect {
        let size = CGSize(width: viewWidth(), height: viewHeight() / 2)
        let origin = CGPoint(x:0, y:0)
        return CGRect(origin:origin, size:size)
    }
    
    func topQuarter() -> CGRect {
        let size = CGSize(width: viewWidth(), height: viewHeight() / 4)
        let origin = CGPoint(x:0, y:0)
        return CGRect(origin:origin, size:size)
    }
    
    func bottomHalf() -> CGRect {
        let size = CGSize(width: viewWidth(), height: viewHeight() / 2)
        let origin = CGPoint(x:0, y:viewHeight() / 2)
        return CGRect(origin:origin, size:size)
    }
    
    func centerX(view: Sized) -> CGFloat {
        return center(view.size.width, total:viewWidth())
    }
    
    func centerY(view: Sized) -> CGFloat {
        return center(view.size.height, total:viewHeight())
    }
    
    func center(length: CGFloat, total: CGFloat) -> CGFloat {
        return ( total - length ) / 2
    }
    
    func viewWidth() -> CGFloat {
        return view.bounds.width
    }
    
    func viewHeight() -> CGFloat {
        return view.bounds.height
    }
    
}