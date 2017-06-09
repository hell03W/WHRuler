# WHRuler

效果图如下所示:

![](http://7xv47b.com1.z0.glb.clouddn.com/17-6-9/53986451.jpg)



简单的使用方法如下所示, 首先创建, 然后做简单的配置, 遵循代理, 从代理中可以拿到刻度尺变化的值.

```
// delegate
func configUI() {

let sweetRuler = SweetRuler(frame: CGRect(x: 10, y: 100, width: 300, height: 40))
view.addSubview(sweetRuler)
sweetRuler.figureRange = Range(uncheckedBounds: (500, 30000))
sweetRuler.setSelectFigure(figure: 18000)
sweetRuler.delegate = self
}

///刻度尺代理方法
func sweetRuler(ruler: SweetRuler, figure: Int){

print("\t\tfigure: \(figure)")
}
```



可配置的选项如下所示:

```
/// 刻度尺表示的范围
var figureRange = Range(uncheckedBounds: (1000,10000))
/// 尺子的长度
var rulerLength: Double = 300
/// 刻度的宽度, 刻度之间的间隔
var dialBlank: Double = 10.0
/// 刻度分割最小的高度
var dialMinHeight: Double = 8
/// 刻度分割最大的高度
var dialMaxHeight: Double = 13
/// 刻度的颜色
var dialColor: UIColor = UIColor.gray
/// 每个刻度表示的宽度
var dialSpan: Int = 100
/// 文字颜色
var textColor: UIColor = UIColor.lightGray
```
