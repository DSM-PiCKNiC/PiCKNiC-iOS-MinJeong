# Access Control

**access control** - 다른 소스 파일 / 모듈에서의 코드 접근 제한

## 코드 구분

- **source file** - 모듈 안에서의 한 파일
- **module** - 코드 배포의 단위 - 대충 빌드 & 배포하고 `import` 할 수 있는 단위이다
- **package** - 모듈 여러개 묶어서 단위화 / build system e.g SPM 에서 설정한다

## Access levels

**open access** `open`
- public + 클래스의 경우 subclassing 허용
- subclass 하도록 디자인된 API임을 명세한다,,
**public access** `public`
- 모듈 내 + 모듈을 import하는 모듈 내의 모든 소스 파일 (:= 전체)
**package access**
- self-explanatory
**internal access** `internal`
- 모듈
**file-private access**`fileprivate`
- self-explanatory
**private access** `private`
- declaration + 같은 파일 내의 extension

## 정해지는 방법

- 기본적으론 *internal access*
