README
------


A minimal example implementation of an iOS framework using swift

- [x] Exports very simple api with tests
- [x] Builds for both simulator and device
- [x] Run tests before build, CI style
- [x] Includes and reads a Resource file
- [x] Runs embedded javascript resource and returns result
- [x] Include external dependency using Carthage
- [x] [Example app in Swift](https://github.com/davibe/ios-framework-example-app-swift)
- [x] [Example app in Objc](https://github.com/davibe/ios-framework-example-app-objc)


Sources

- https://medium.com/@PyBaig/build-your-own-cocoa-touch-frameworks-in-swift-d4ea3d1f9ca3#.rizcvnju4
- http://stackoverflow.com/questions/29634466/how-to-export-fat-cocoa-touch-framework-for-simulator-and-device
- https://gist.github.com/cromandini/1a9c4aeab27ca84f5d79

### Test and Build

    cd $THIS_PROJECT
    bash scripts/build.sh

The output is `MyFramework.framework` generated in the project dir 

Note that scripts/universal-framework can be embedded into an xcode aggregate target
but I prefer to keep it out of XCode.
