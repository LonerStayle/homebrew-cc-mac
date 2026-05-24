# homebrew-cc-mac

> 여러 Claude Code 탭의 응답 대기 상황을 한눈에 보는 macOS 상황판.

여러 터미널 탭에서 Claude Code 를 동시에 돌릴 때
"어떤 탭이 지금 내 답을 기다리고 있는지" 한눈에 보여주는 데스크탑 앱.

## 설치

```bash
brew tap LonerStayle/cc-mac
brew install --cask cc-mac
open -a CCPendingMonitor
```

처음 실행하면 setup 화면이 뜹니다.
**hook 설치** + **자동 시작 등록** 버튼 두 번 클릭으로 끝.

## 사용법

1. Claude Code 의 아무 탭에서 `AskUserQuestion` 또는 권한 prompt 가 뜨면
2. CCPendingMonitor 리스트에 해당 탭이 자동 표시
3. 행 클릭 → 해당 iTerm2 세션으로 자동 활성화
4. 답변 / 권한 처리 후 자동으로 리스트에서 사라짐

리스트가 비었을 때 = 모든 탭이 작업 중 (대기 없음).

## 요구사항

- macOS 14 (Sonoma) 이상
- Claude Code CLI
- (선택) iTerm2 — 클릭 시 세션 자동 활성화 기능에 필요

## 업데이트

```bash
brew upgrade --cask cc-mac
```

## 제거

```bash
brew uninstall --cask --zap cc-mac
```

`--zap` 은 로그 / LaunchAgent / `/tmp/cc-pending/` 까지 정리합니다.
`~/.claude/settings.json` 의 hook 항목은 자동 제거되지 않습니다
(사용자가 손댄 파일이라 안전상). 필요 시
`~/.claude/settings.json.bak.*` 백업으로 복원.

## 이슈 / 피드백

이 repo 의 [Issues](https://github.com/LonerStayle/homebrew-cc-mac/issues) 에 남겨주세요.
소스는 비공개이지만 버그 / 요청은 환영.

## 라이선스

(원하는 라이선스 — MIT / Apache-2.0 / 사용자 정의 등)
