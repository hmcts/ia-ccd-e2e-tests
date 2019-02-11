const iaConfig = require('../ia.conf');

export enum Wait {
    minimal = iaConfig.RunningOnAAT ? 3000 : 100,
    short = iaConfig.RunningOnAAT ? 10000 : 1000,
    normal = iaConfig.RunningOnAAT ? 30000 : 10000,
    long = iaConfig.RunningOnAAT ? 120000 : 60000
}
