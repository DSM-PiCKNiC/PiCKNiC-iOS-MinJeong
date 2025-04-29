# GCD

**GCD (Grand Central Dispatch)** = *concurrent한 코드 실행*을 위한 언어 기능, 라이브러리, API 등
→ 원래는 스레드에 작업 추가, 우선순위 관리 등등 했던 걸 추상화

## DispatchQueue

- 태스크를 실행하는 FIFO 큐
- 태스크는 thread pool 에서 실행됨

태스크 실행 방법
- **serial** - 하나의 스레드만 사용 → 한번에 한 작업만
- **concurrent** - 스레드 여러 개 사용 (blocking 시 새로 만듦?) → 작업을 동시에

태스크 넣기
- **sync** - 태스크 끝날 때까지 기다림
- **async** - 태스크 종료를 기다리지 않고 넘어감

종류
- **main queue** - `DispatchQueue.main` - main thread와 연관됨, serial → 기본적으로 작업을 굴리는 큐
- **global system queue** - `DispatchQueue.global()` - QoS 레벨에 따라 실행?, concurrent
- **custom** - `DispatchQueue()` - 직접 configuration 가능

## Resources

[\[Swift\] GCD(Grand Central Dispatch) - Dispatch Queue](https://jeonyeohun.tistory.com/279)
[Grand Central Dispatch | Swift by Sundell](https://www.swiftbysundell.com/basics/grand-central-dispatch/)
[Dispatch | Apple Developer Documentation](https://developer.apple.com/documentation/DISPATCH)
