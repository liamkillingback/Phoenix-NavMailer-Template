// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");
const fs = require("fs");
const path = require("path");

module.exports = {
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  theme: {
    extend: {
      colors: {
        "washed-purple-50": "#f8f7ff",
        "washed-purple-100": "#e8e7ff",
        "washed-purple-200": "#dddcff",
        "washed-purple-300": "#cdcbff",
        "washed-purple-400": "#c4c1ff",
        "washed-purple-500": "#b5b2ff",
        "washed-purple-600": "#a5a2e8",
        "washed-purple-700": "#817eb5",
        "washed-purple-800": "#64628c",
        "washed-purple-900": "#4c4b6b",
        "washed-blue-50": "#f0f3ff",
        "washed-blue-100": "#d0daff",
        "washed-blue-200": "#bac9ff",
        "washed-blue-300": "#9ab0ff",
        "washed-blue-400": "#86a1ff",
        "washed-blue-500": "#6889ff",
        "washed-blue-600": "#5f7de8",
        "washed-blue-700": "#4a61b5",
        "washed-blue-800": "#394b8c",
        "washed-blue-900": "#2c3a6b",
        "primary-blue-50": "#e6f0ff",
        "primary-blue-100": "#b1d1ff",
        "primary-blue-200": "#8cbaff",
        "primary-blue-300": "#579bff",
        "primary-blue-400": "#3687ff",
        "primary-blue-500": "#0469ff",
        "primary-blue-600": "#0460e8",
        "primary-blue-700": "#034bb5",
        "primary-blue-800": "#023a8c",
        "primary-blue-900": "#022c6b",
        "primary-purple-50": "#f1e6ff",
        "primary-purple-100": "#d3b0ff",
        "primary-purple-200": "#bd8aff",
        "primary-purple-300": "#9f54ff",
        "primary-purple-400": "#8d33ff",
        "primary-purple-500": "#7000ff",
        "primary-purple-600": "#6600e8",
        "primary-purple-700": "#5000b5",
        "primary-purple-800": "#3e008c",
        "primary-purple-900": "#2f006b",
        "neutrals-1": "#ffffff",
        "neutrals-2": "#fcfcfd",
        "neutrals-3": "#f5f5f6",
        "neutrals-4": "#f0f0f1",
        "neutrals-5": "#d9d9dc",
        "neutrals-6": "#c0bfc4",
        "neutrals-7": "#8e8c95",
        "neutrals-8": "#5b5966",
        "neutrals-9": "#474553",
        "neutrals-10": "#292637",
        "neutrals-11": "#211f30",
        "neutrals-12": "#171427",
        "neutrals-13": "#030014",
        "brand/brand-washedPurple": "#b5b2ff",
        "brand/brand-washedBlue": "#6889ff",
        "brand/brand-primaryBlue": "#0469ff",
        "brand/brand-primaryPurple": "#7000ff",
        "brand/brand-dark": "#030014",
      },
      fontSize: {
        base: "1rem",
        lg: "1.125rem",
        xl: "1.5625rem",
        "2xl": "1.625rem",
        "3xl": "2.1875rem",
        "4xl": "2.8125rem",
        "5xl": "3.4375rem",
        "6xl": "4.0625rem",
      },
      fontFamily: {
        inter: "Inter",
      },
      borderRadius: {
        none: "0",
        xs: "0.02500000037252903rem",
        sm: "0.03125rem",
        default: "0.05000000074505806rem",
        lg: "0.0625rem",
        xl: "0.06875000149011612rem",
        "2xl": "0.07500000298023224rem",
        "3xl": "0.09375rem",
        "4xl": "0.125rem",
        "5xl": "0.15625rem",
        "6xl": "0.1875rem",
        "7xl": "0.21875rem",
        "8xl": "0.25rem",
        "9xl": "0.3125rem",
        "10xl": "0.4285714328289032rem",
        "11xl": "0.4375rem",
        "12xl": "0.5rem",
        "13xl": "0.625rem",
        "14xl": "0.75rem",
        "15xl": "1.25rem",
        "16xl": "1.75rem",
        "17xl": "1.8125rem",
        "18xl": "1.875rem",
        "19xl": "2.625rem",
        "20xl": "3.125rem",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) =>
      addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [
        ".phx-click-loading&",
        ".phx-click-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [
        ".phx-submit-loading&",
        ".phx-submit-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [
        ".phx-change-loading&",
        ".phx-change-loading &",
      ])
    ),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized");
      let values = {};
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
      ];
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map((file) => {
          let name = path.basename(file, ".svg") + suffix;
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
        });
      });
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: theme("spacing.5"),
              height: theme("spacing.5"),
            };
          },
        },
        { values }
      );
    }),
  ],
};
