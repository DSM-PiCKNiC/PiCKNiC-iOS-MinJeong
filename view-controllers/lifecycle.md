# UIViewController Life cycle

## Load

- `loadView()` - `view`를 요청받았는데 없을 때 호출됨 → *뷰 만들기*
	- 기본 동작 - nib 파일 있으면 그걸 불러오고 없으면 empty `UIView`
	- 오버라이드해서 커스텀 뷰를 줄 수 있음, 이때 super 호출 x
- `viewDidLoad()` - 뷰 만들어진 이후 → *이미 만들어진 뷰에 설정하기*
	- 여기서 뷰를 만들어서 `view`에 할당하는 건 책임에 어긋남

## Appear

view hierarchy 에 추가되려고 할 때

1. `viewWillAppear()`
2. view가 hierarchy에 추가됨
3. `viewIsAppearing()`
4. `viewWillLayoutSubviews()`
5. `viewDidLayoutSubviews()`
6. transiiton
7. `viewDidAppear()`

## Disappear

view hierarchy 에서 제거될 때

1. `viewWillDisappear()`
2. `viewDidDisappear()`

## Resources

[loadView() | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller/loadview())
[viewIsAppearing(\_:) | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiviewcontroller/viewisappearing(_:))
