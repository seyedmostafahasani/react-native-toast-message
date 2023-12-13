import { useEffect, useState } from 'react';
import { SafeArea } from '../SafeAreaModule'; // Replace with the actual path to your module

interface SafeAreaInsets {
	top: number;
	bottom: number;
	left: number;
	right: number;
}

export function useSafeArea(): SafeAreaInsets | null {
	const [safeAreaInsets, setSafeAreaInsets] = useState<SafeAreaInsets | null>(null);

	useEffect(() => {
		const fetchSafeAreaInsets = async () => {
			try {
				const insets = await SafeArea.getSafeAreaInsets();
				setSafeAreaInsets(insets);
			} catch (error) {
				console.error('Error fetching safe area insets:', error);
			}
		};

		fetchSafeAreaInsets();
	}, []);

	return safeAreaInsets;
}
