<p align="center">
    <img src="Art/header.png" width="890" alt="TinyConstraints"/>
    <img src="Art/header.gif" width="890" alt="TinyConstraints"/>
</p>

**TinyConstraints** is the syntactic sugar that makes Auto Layout sweeter for human use.

## Features

- [X] Pure Swift 5 sweetness.
- [X] Shortest possible syntax for creating layout constraints.
- [X] Constraints are active by default.
- [X] 100% compatible with Auto Layout.
- [X] Optionally store your constraints.
- [X] Set constraint priorities upon creation.
- [X] Constrain directly to the superview.
- [X] Stack views together with one line of code.
- [X] No need to set `translatesAutoresizingMaskIntoConstraints` because `TinyConstraints` does it for you.

## Examples
### Edges
Attaching a view to its superview with `NSLayoutConstraint`:

```swift
NSLayoutConstraint.activate([
    view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0),
    view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0),
    view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0),
    view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0)
])
```

with `TinyConstraints`:

```swift
view.edgesToSuperView()
```

or:

```swift
view.edgesToSuperView(insets: .top(10) + .left(10))
```
### Center
Constraining the center of a view to its superview with `NSLayoutConstraint`:

```swift
NSLayoutConstraint.activate([
    view.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: 0)
    view.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 0)
])
```

with `TinyConstraints`:

```swift
view.center(in: superview)
```

or:

```swift
view.center(in: superview, offset: CGPoint(x: 10, y: 10))
```

## Basic Use

### Typealiases

`TinyConstraints` gives you convenient and tiny typealiases for handling constraints.

- `Constraint` = `NSLayoutConstraint`
- `Constraints` = `[NSLayoutConstraint]`

### Equal and Unequal Anchors
This constraints the `top-anchor` of the view to the `top-anchor` of the superview:

```swift
view.top(to: superview)
```

This constraints the `top-anchor` of `firstView` to the `bottom-anchor` of `secondView`:

```swift
firstView.topToBottom(of: secondView)
```

### Constrain to Superview
Often you need to constrain a view to it's superview, with TinyConstraints you can do this super easy:

```swift
view.edgesToSuperview()
```

Or only one edge:

```swift
view.topToSuperview()
```

Or you can attach all edges except one, like this:

```swift
view.edgesToSuperview(excluding: .bottom)
```

### Relation and Priority
For almost all constraints you can set the `relation` and `priority` properties. The default relation is `.equal` and the default priority is `.required`:

```swift
container.width(150, relation: .equalOrLess, priority: .high)
```

### Storing Constraints
Here we create a set of inactive constraints and store these to our property:

```swift
let constraints = view.size(CGSize(width: 100, height: 100), isActive: false)
```

### Activation and Deactivation
Besides the default `NSLayoutConstraint` activation, `TinyConstraints` also provides a way to activate *a set* of constraints:

```swift
constraints.activate()
```

You can also do this in an animation:

```swift
oldConstraints.deActivate()

constraints.activate()
UIViewPropertyAnimator(duration: 1, dampingRatio: 0.4) {
    self.layoutIfNeeded()
}.startAnimation()
```

### Animating Constraint Constants
Here we add a height constraint to a view, store it and animate it later:

```swift
let height = view.height(100)

height.constant = 200
UIViewPropertyAnimator(duration: 1, dampingRatio: 0.4) {
    self.layoutIfNeeded()
}.startAnimation()
```

### Stack
Stack provides a way of constraining views together in a superview:

```swift
let views = [logo, title, description]
superview.stack(views, axis: .vertical, spacing: 10)
```

##### Find these examples and more in the *Example Project*.

## Installation

### CocoaPods

TinyConstraints is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TinyConstraints"
```

### Carthage

TinyConstraints is available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```
github "roberthein/TinyConstraints"
```

## Suggestions or feedback?

Feel free to create a pull request, open an issue or find [me on Twitter](https://twitter.com/roberthein).
