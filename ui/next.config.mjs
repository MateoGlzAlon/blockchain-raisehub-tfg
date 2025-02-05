/** @type {import('next').NextConfig} */
const nextConfig = {
    //reactStrictMode: false, // Set to 'false' to disable React Strict Mode
    output: "standalone",
    images: {
        unoptimized: true, // Disable image optimization
    },
    webpack: (config) => {
        config.resolve.fallback = { encoding: false };
        return config;
    },
};

export default nextConfig;
