/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        cream: {
          50: '#FFFEF5',
          100: '#FFF9E6',
          200: '#FFF0B8',
          300: '#FFE68A',
        },
        sky: {
          soft: '#E0F2FE',
          card: '#BAE6FD',
          deep: '#38BDF8',
        },
        coco: {
          brown: '#78350F',
          amber: '#F59E0B',
          honey: '#FBBF24',
          ear: '#FCD34D',
          cheek: '#FDA4AF',
        },
        forest: {
          light: '#DCFCE7',
          main: '#22C55E',
          dark: '#16A34A',
        }
      },
      fontFamily: {
        comic: ['"Comic Sans MS"', '"Chalkboard SE"', '"Comic Neue"', 'cursive', 'sans-serif'],
      },
      boxShadow: {
        '3d-yellow': '0 8px 0 #D97706',
        '3d-green': '0 8px 0 #15803D',
        '3d-blue': '0 8px 0 #0284C7',
        '3d-red': '0 8px 0 #BE123C',
        '3d-purple': '0 8px 0 #7E22CE',
        '3d-orange': '0 8px 0 #C2410C',
        'card-pop': '0 12px 0 rgba(0,0,0,0.06), 0 20px 25px -5px rgba(0,0,0,0.1)',
      }
    },
  },
  plugins: [],
}
