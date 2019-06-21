# Learn Flutter

A Dart and Flutter App that:

- Infinitely collects random images from the Internet using `picsum`
- Infinitely collects random phrases from the English-Words package

## Notes
#### Basic Flutter commands
- `flutter doctor` - Run diagnostics
- `flutter create` - Create new App
- `flutter run` - Run the App
- `flutter clear` - Clear config

#### VS Code shortcuts
> NB: Install the Dart and Flutter extensions.
- Format document - `Shift + Option + F`

#### Asset management
e.g. `assets/image.jpg`
Add it to `pubspec.yaml` under `assets`
```
Image.asset('assets/image.jpg');
```

#### Basic Widgets (and *common* properties)
- MaterialApp
  - home:
  - theme:
- Scaffold
  - appBar:
  - body:
- Column
- Container
- Center
- Card
- ListView.builder
  - itemBuilder() - callback
- Text
  - style
- Image
- Icon

More: https://flutter.dev/docs/development/ui/widgets

#### Themes
```
MaterialApp(
  theme: ThemeData(
    primarySwatch: Color...
    accentColor: Color...
  )
  ...
)
```
```
YourWidget(
  color: Theme.of(context).primaryColorDark ...
)
```

#### Cool Widgets
- SafeArea - Area unencumbered by Notches, Curves, ... e.g.
  ```
  Scaffold(
    ...
    body: SafeArea(
      child: 
      ...
    ),
  );
  ```
###### 1. Size and Responsiveness
- SafeArea
- Expanded - "flex grow" behaviour
  - Can combine with `Align` and `AspectRatio` Widgets
- Flexible - change size according to parent
- FittedBox - "overflow hidden", fit width, fill, ... 
- Wrap - wrap children (don't go beyond screen) - also allows "flex-direction" behaviour 
- SizedBox - set specific size, add gaps between widgets, expand to fill Horizontally or Vertically.
- LayoutBuilder - responsiveness
  - Orientation
  - Font-size
  - Size ... e.g.
  ```screensize = MediaQuery.of(context).size```
- Align - BR, TL, TR, BL, custom, ... (Can be used in Stack as well)
- Spacer - space between Widgets
- Row and Column
  - mainAxisAlignment [spaceAround || spaceBetween || spaceEvenly]   

###### 2. Animations and Transitions
- AnimatedIcon
- AnimatedContainer - auto animation when state changes / on rebuild
- AnimatedOpacity - on rebuild
- FadeTransition - Wrap in Stateful Widget
- Hero - animate transition from group/list to detail view
- CustomPaint - custom animations and drawings
- AnimatedBuilder - build animations - recommended to put AnimationController in a StatefulWidget
- Dismissible - swipe U, D, L, R to remove Widget. `onDismissed()`
- Draggable - drag widgets
- AnimatedList

###### 3. Async Loading and Child updating ↺
- FutureBuilder - async builder
- StreamBuilder - async builder
- FadeInImage - load image from network, show stub
- InheritedWidget (Also see InheritedModel)
  - Flutter State Management: https://pub.dev/packages/provider 
- InheritedModel - update inherited properties
- ValueListenableBuilder 

###### 4. Change Display / Behaviour
- Opacity
- ClipRRect - shape edges of child
- AbsorbPointer - disables Touch Widgets
- Transform - rotate, scale, translate, matrix for custom ones.
- BackdropFilter - filter widgets beneath the child

###### 5. Uncategorized Coolness 😎
- FloatingActionButton with floatingActionButtonLocation to embed into Nav
- PageView with pageController to Swipe among pages
- SliverAppBar - custom scroll for AppBar
- SliverGrid and SliverList - multiple scrolling areas on screen
- Tooltip - PS: IconButton already has a tooltip property
- Stack - overlap several children
  - Positioned - position elements in a Stack
  - Also See *Align*


**More on the Official Flutter Youtube Playlist (Widget of the Week):**
https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG

#### StatefulWidgets
- Extend StatefulWidget class
- Add `createState()`
- Create State class (extends State)
- Add `build(context)`
- Use `setState()` to update State
- In the State class, use `widget.` to access properties of the StatefulWidget

> Can use `didUpdateWidget()` to perform actions before build is called

```
class RandomWords extends StatefulWidget {
  @override
  RandomWordsSate createState() => RandomWordsSate();
}

class RandomWordsSate extends State<RandomWords> {
  final String _stateProperty1; // should be final, private and immutable

  @override
  void initState() {
    // code here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YourWidgetHere;
  }
}
```

<img src="https://iviidev.info/downloads/first-app.png" />
