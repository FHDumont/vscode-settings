#!/bin/bash

YELLOW='\033[1;33m'
GREEN='\033[1;32m'
LCYAN='\033[1;36m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Style Formatting Configuration... ${NC}"

echo -e "1/5 ${LCYAN}Reactotron Installation... ${NC}"
# npm install -D eslint@5.6.0 prettier
# npm install -D eslint prettier
yarn add reactotron-react-native reactotron-redux reactotron-redux-saga --dev

mkdir -p ./src/config/

echo -e "4/5 ${YELLOW}Creating ESLint JSON... ${NC}"
touch ./src/config/ReactotronConfig.js

echo '
import Reactotron from "reactotron-react-native";
// import { reactotronRedux as reduxPlugin } from "reactotron-redux"
// import sagaPlugin from "reactotron-redux-saga"

console.disableYellowBox = true;

// First, set some configuration settings on how to connect to the app
Reactotron.configure({
  name: "Demo App",
  host: "10.0.0.100"
  // port: 9091
});

// add every built-in react native feature.  you also have the ability to pass
// an object as a parameter to configure each individual react-native plugin
// if you"d like.
Reactotron.useReactNative();

// add some more plugins for redux & redux-saga
// Reactotron.use(reduxPlugin());
// Reactotron.use(sagaPlugin());
// Reactron.use(reactotronRedux());


// if we"re running in DEV mode, then let"s connect!
if (__DEV__) {
  Reactotron.connect();
  Reactotron.clear();
}

Reactotron.onCustomCommand("test", () => console.tron.log("This is an example"));

console.tron = Reactotron;

' >> ./src/config/ReactotronConfig.js

echo -e "${GREEN}Done! ${NC}"
