'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "4a2fd56e25ab65c2d2f46c768574aa41",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/icons/pallete.svg": "b6aeff7f46df08cb6beb70e3a44f65d9",
"assets/assets/icons/plain.svg": "1268e920e2d81650e1e761a28a7d5120",
"assets/assets/icons/chevron_down.svg": "b30c26f15351584a0b1e8052f6ba71e9",
"assets/assets/icons/shield.svg": "9c76b87418ab927efe1a52be5411463b",
"assets/assets/icons/linkedin_logo.svg": "c4396627ff011bf0b488bd6efd0f3040",
"assets/assets/icons/check.svg": "f4d3dbd6e77971e68e379aa760258ed2",
"assets/assets/icons/arrow_up.svg": "8665cbb76b03cdc0df54ccb5bd982222",
"assets/assets/icons/close.svg": "aba03af15eb3815d844df4ea5b56753d",
"assets/assets/icons/magic_stick.svg": "6ca90aaca36be56bf92101b746d324c0",
"assets/assets/icons/hand.svg": "4dbf78b5a4c2bf365f52a910d19e8d14",
"assets/assets/icons/graph.svg": "7465fcc22c75d99694fe0edced0b8307",
"assets/assets/icons/tiktok_logo.svg": "222d04c341d6c17292609fe5b99cfae1",
"assets/assets/icons/progress_indicator.svg": "e95810bbc0a07bf175f7f710e71c9f92",
"assets/assets/icons/heart.svg": "165a79c04a82854815f869d92507300d",
"assets/assets/icons/email.svg": "eea9e19313b78d8491041913a9cc2643",
"assets/assets/icons/user_heart.svg": "be700cd580d45417c7d44b3968c8c290",
"assets/assets/icons/chevron_right.svg": "413d5f85edd2b4d0ab78de972c2992c2",
"assets/assets/icons/calendar.svg": "0fb756f705594294349290cac554eecf",
"assets/assets/icons/arrow_down.svg": "5af343e677925c9b13807645f73a8687",
"assets/assets/icons/instagram_logo.svg": "7a831c8e6abd92e345452edf4f6bfa2f",
"assets/assets/icons/facebook_logo.svg": "514311ec27eedcbaa953f795d4d34be5",
"assets/assets/icons/test_tube.svg": "ff77f1da9255c87955f364e78e1d20e2",
"assets/assets/icons/rocket.svg": "30e350a570c16040301b10ca8182055b",
"assets/assets/icons/code.svg": "7263d42087d2d140aeea4a667e53df5f",
"assets/assets/icons/dumbbell.svg": "8de5ded0d6946c02256c04af90824afe",
"assets/assets/logo.svg": "3657d24724d6d1ba2940ca763d2ea4a8",
"assets/assets/mock/workout_settings.svg": "6961ea46e15229d3cf60d941f4bef4e5",
"assets/assets/mock/home_page.svg": "b07394d8f73f8d0c768e8edbcc57e761",
"assets/assets/mock/health_conditions.svg": "49f54a5444a91e7119736fea7f23a9be",
"assets/assets/mock/daily_updates.svg": "ceeac4be65dcf2165e6d47482d5aa662",
"assets/assets/mock/workout_overview.svg": "7da01a332e8e3c91c794f3d4f51d79b5",
"assets/assets/logo.png": "623c044ef7387b16e0fdee16cccb94b6",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/AssetManifest.bin": "2d472838f80033d4e71d256949965c21",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.json": "6f730ce8a80b458fd18fb07e48de7081",
"assets/NOTICES": "e4de837cdd0dee26befaf0bed9a6c0ab",
"index.html": "52c12be1eaae19029c97dc3912705841",
"/": "52c12be1eaae19029c97dc3912705841",
"main.dart.js": "50d490d7582de6e45bafad17489772c4",
"favicon.png": "d2c54777a8e6c58bc0adc92998bfbd33",
"version.json": "60ca2ac3cfb2e6df112aea6b9b12c68e",
"flutter_bootstrap.js": "57b665f428a1685db01e5c67639d6e24",
"favicon.ico": "d262a65cb8b36334035c8cad947773f2",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "943bf34e1c8707af8a22a79d0a6e179b",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
