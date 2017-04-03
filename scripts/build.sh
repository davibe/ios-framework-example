export SCRIPTDIR=$(pwd)

# Set up env var as if we were launched by xcode
export PROJECT_NAME=MyFramework
export BUILD_DIR=$SCRIPTDIR/build
export PROJECT_DIR=$SCRIPTDIR
export CONFIGURATION=Debug
export UNIVERSAL_OUTPUTFOLDER=$BUILD_DIR/$CONFIGURATION-universal

# Run tests
# Unfortunaltey the destination string has to be guessed
xcodebuild test \
  -target $PROJECT_NAME \
  -scheme $PROJECT_NAME \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 7'

# Launch the build
./scripts/universal-framework.sh

# Remove intermediate files
rm -rf build



