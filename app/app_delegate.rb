class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'boo'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    vc = UIViewController.alloc.init
    vc.view.backgroundColor = UIColor.whiteColor

    @window.rootViewController = vc

    @months = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"]
    @picker = UIPickerView.alloc.initWithFrame([[0,0],[320,200]])
    @picker.delegate = self

    btn = UIButton.buttonWithType UIButtonTypeRoundedRect
    btn.frame = [[0,200], [90,50]]
    btn.setTitle("Tap!", forState: UIControlStateNormal)
    btn.addTarget self, action: 'tapped',
        forControlEvents: UIControlEventTouchUpInside

    vc.view.addSubview @picker
    vc.view.addSubview(btn)

    true
  end

  def tapped
    p "Tapped"
    p @picker.selectedRowForColumn(0)
  end

  def numberOfComponentsInPickerView(pickerView)
    1
  end

  def pickerView(pickerView, numberOfRowsInComponent:component)
    @months.count
  end

  def pickerView(pickerView, titleForRow:row, forComponent: component)
    @months.objectAtIndex row
  end

  def pickerView(pickerView, viewForRow:row, forComponent: component, reusingView: view)
    month_label = UILabel.alloc.initWithFrame CGRectMake(0, 0, pickerView.frame.size.width, 44)
    month_label.text = "#{@months.objectAtIndex row}".uppercaseString
    month_label
  end

  def pickerView(pickerView, didSelectRow: row, inComponent: component)
    p @months.objectAtIndex(row)
  end
end
