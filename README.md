# easy_timer

A simple and lightweight Flutter timer package with countdown and count up support.

## Features

- Countdown timer (e.g. 60 to 0)
- Count up timer / stopwatch (0 upward, with optional limit)
- Start, pause and reset controls
- HH:MM:SS time formatting
- Custom UI support with `EasyTimerBuilder`

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  easy_timer: ^1.0.0
```

Then run:

```
flutter pub get
```

## Usage

### 1. Create a controller

```dart
import 'package:easy_timer/easy_timer.dart';

final EasyTimeController controller = EasyTimeController();
```

### 2. Set duration

```dart
// Countdown: 60 to 0
controller.setDuration(second: 60, isCountDown: true);

// Count up: 0 to 60, then stops
controller.setDuration(second: 60, isCountDown: false);

// Stopwatch: 0 upward, no limit
controller.setDuration(second: 0, isCountDown: false);
```

### 3. Show the timer

```dart
CountDownTimer(easyTimeController: controller)
```

Or with your own text style:

```dart
EasyTimerBuilder(
  controller: controller,
  builder: (context, second) {
    return Text(
      TimeFormate.formateSecond(second),
      style: const TextStyle(fontSize: 40, color: Colors.blue),
    );
  },
)
```

### 4. Control the timer

```dart
controller.start();
controller.pause();
controller.reset();
```
### 5. SaveTime
String time = controller.saveTime();   // "02:05" ba "01:02:05"

### 6. Dispose

```dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

## Timer states

| State | Meaning |
|---|---|
| `TimerState.initial` | Not started |
| `TimerState.running` | Running |
| `TimerState.paused` | Paused |
| `TimerState.completed` | Finished |

## Additional information

Source code: https://github.com/md-ashad-ali/easy_timer

Issues and contributions are welcome.