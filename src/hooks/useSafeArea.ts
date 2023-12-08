
import {NativeModules} from "react-native"

const {ToastMessage} = NativeModules
export const useSafeAreaInsets = async () => {
	try {
		const safeAreaInsets = await ToastMessage.getSafeAreaInsets();
		console.log('Safe Area Insets:', safeAreaInsets);
	} catch (error) {
		console.error('Error retrieving safe area insets:', error);
	}
};
