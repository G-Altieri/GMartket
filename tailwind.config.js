/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/main/webapp/**/*.{html,js,ftl}"],
    theme: {
        extend: {
            colors: {
                primario: '#3E53A0',
                dark: '#08112F',
                bluChiaro: '#5A77DF',
                bluScuro: '#323954',
                giallo2: '#FFC107',
                rosso2: '#E53935',
                verde: '#43A047',
                light: '#F3F4F6',
                griggioChiaro: '#ECEEF0',
                griggioScuro: '#CCD4DE',
                giallino: '#FEFFE5',
            },
            boxShadow: {
                buttonBox: '0px 2px 8px 0px rgba(0, 0, 0, 0.37)',
                normalBox: '0px 3px 22px 0px rgba(0, 0, 0, 0.15)',
                buttonBoxHover: ' 0px 1px 4px rgba(0, 0, 0, 0.16)',
            },
        },
    },
    plugins: [],
}
//npx tailwindcss -i ./src/main/webapp/styles/global.css -o ./src/main/webapp/styles/tailwind2.css --watch