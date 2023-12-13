import { NativeEventEmitter, NativeModules } from 'react-native';
import {SafeAreaInsets, SafeAreaModuleTyp} from './types';

const { SafeAreaModule } = NativeModules;
const SafeAreaModuleEmitter = new NativeEventEmitter(SafeAreaModule);

export const SafeArea: SafeAreaModuleTyp = {
  getSafeAreaInsets(callback) {
    SafeAreaModule.getSafeAreaInsets((error?: Error | null, result?: SafeAreaInsets) => {
      if (error) {
        callback(error);
      } else {
        callback(null, result);
      }
    });
  },
};

export default SafeAreaModuleEmitter;
