import { NativeEventEmitter, NativeModules } from 'react-native';
import { SafeAreaInsets } from './types';

interface SafeAreaModuleType {
  getSafeAreaInsets(callback: (error: Error | null, result?: SafeAreaInsets) => void): void;
}

const { SafeAreaModule } = NativeModules;
const SafeAreaModuleEmitter = new NativeEventEmitter(SafeAreaModule);

export const SafeArea: SafeAreaModuleType = {
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
