module.exports = {
  multiCapabilities: [
    // {
    //   browserName: 'chrome',
    //   version: 'latest',
    //   platform: 'Windows 10',
    //   name: 'ia-chrome-windows-test',
    //   tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
    //   extendedDebugging: true,
    //   capturePerformance: true,
    //   maxInstances: 2,
    // },
    {
      browserName: 'firefox',
      version: 'latest',
      platform: 'Windows 10',
      metadata: {
        platform: {
          name: 'Windows',
          version: '10'
        }
      },
      name: 'ia-firefox-windows-test',
      tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
      extendedDebugging: true,
      capturePerformance: true,
      sharedTestFiles: 2,
      shardTestFiles: 2,
      maxInstances: 2,
    },
    // {
    //   browserName: 'chrome',
    //   version: 'latest',
    //   platform: 'macOS 10.13',
    //   name: 'ia-chrome-mac-test',
    //   tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
    //   extendedDebugging: true,
    //   capturePerformance: true,
    //   maxInstances: 2,
    // },
    {
      browserName: 'firefox',
      version: 'latest',
      platform: 'macOS 10.13',
      metadata: {
        platform: {
          name: 'Mac OS',
          version: '10.13'
        }
      },
      name: 'ia-firefox-mac-test',
      tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
      extendedDebugging: true,
      capturePerformance: true,
      sharedTestFiles: 2,
      shardTestFiles: 2,
      maxInstances: 2,
    },
    // {
    //   browserName: 'safari',
    //   platform: 'macOS 10.13',
    //   version: 'latest-1',
    //   name: 'ia-safari-mac-test',
    //   tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
    //   extendedDebugging: true,
    //   capturePerformance: true,
    //   maxInstances: 2
    // },
    {
      browserName: 'MicrosoftEdge',
      version: 'latest',
      platform: 'Windows 10',
      metadata: {
        platform: {
          name: 'Windows',
          version: '10'
        }
      },
      name: 'ia-microsoft-edge-windows-test',
      tunnelIdentifier: process.env.TUNNEL_IDENTIFIER || 'reformtunnel',
      extendedDebugging: true,
      capturePerformance: true,
      sharedTestFiles: 2,
      shardTestFiles: 2,
      maxInstances: 2,
    },
  ],
};
