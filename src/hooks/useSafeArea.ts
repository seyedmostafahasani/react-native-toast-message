import { useEffect, useState } from 'react';
import SafeAreaModule, { SafeArea } from '../SafeAreaModule'; // Replace with the actual path to your module

interface SafeAreaInsets {
	top: number;
	bottom: number;
	left: number;
	right: number;
}

export function useSafeArea(): SafeAreaInsets | undefined {
	const [safeAreaInsets, setSafeAreaInsets] = useState<SafeAreaInsets | undefined>(undefined);

	useEffect(() => {
		const fetchSafeAreaInsets = async () => {
			SafeArea.getSafeAreaInsets((error, result) => {
				if (error) {
					console.error(error);
				} else {
					console.log(result);
					setSafeAreaInsets(result)
				}
			});
		};

		fetchSafeAreaInsets();
	}, []);

	return safeAreaInsets;
}
