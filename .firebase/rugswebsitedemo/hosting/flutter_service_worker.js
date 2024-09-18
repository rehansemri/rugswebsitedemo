'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "84595300c244b6da3ca7b63a444a1305",
"assets/AssetManifest.bin.json": "9a7c70ca0a89bcf0a0fa85b299ebb127",
"assets/AssetManifest.json": "3f54c9a96a4cf5fc35810da70f7c4157",
"assets/assets/images/banner.jpg": "94b165b943826bd9a37794a7d4459aad",
"assets/assets/images/banner.png": "c6c3970e1f320a28b54f68a4724c5129",
"assets/assets/images/banner1.webp": "6ed200d0e7ad6aa3efa70e53e2493bb5",
"assets/assets/images/banner2.webp": "021d09b108516ccd25ba04ae07aa4269",
"assets/assets/images/banner3.webp": "279e405aa6f4c7c4b8b8cbebdb6f97c7",
"assets/assets/images/city-1.png": "cfab9897cac91f8994b3e87541182eb3",
"assets/assets/images/city-2.png": "c15183a0428874b709dcc07176255470",
"assets/assets/images/city-3.png": "2d33650da7a1447933a0851817755c6a",
"assets/assets/images/city-4.png": "efbc8f39dcbca86f00815d69517483da",
"assets/assets/images/city-5.png": "2f3c2b2928a5fe0d08acb90a826b0212",
"assets/assets/images/city-6.png": "6abd5e6037e5ea5eb6ac8a84f988d418",
"assets/assets/images/desktop.ini": "bc705d12800edba9320e4e5ea1b91812",
"assets/assets/images/favicon.png": "6d6517eb59c58cc33744e21d2948c4d0",
"assets/assets/images/h1.png": "ac5834abfe74100857694d0ce0eb421d",
"assets/assets/images/h2.png": "6d6517eb59c58cc33744e21d2948c4d0",
"assets/assets/images/h3.png": "e60817a2308d87b1f65f552fc78fbaa1",
"assets/assets/images/h4.png": "73f4cc652cd52c2274c6026095b84cb2",
"assets/assets/images/h6.png": "e4bd859c062cb1da67a3e425b0f8fa9c",
"assets/assets/images/immio.jpg": "c5f2e447db2c4a16d68344a662aa4b3d",
"assets/assets/images/logo-light.png": "56c6cd6e4bc0475ab0ff2c9952238061",
"assets/assets/images/logo.png": "177e648ef9a01b996019b433983eb32d",
"assets/assets/images/logo_light.png": "c497b556f99942ad41d7cc369719d2b4",
"assets/assets/images/p-1.png": "5170f7cebdae6cb380f0ad66ff19458a",
"assets/assets/images/p-2.png": "a31a6c1d2ddf06b03ae45bf662ecfdc8",
"assets/assets/images/p-3.png": "7c09d0d1091e484e23371ec75d5e1b01",
"assets/assets/images/p-4.png": "ee7c8cd38c6ea0b0c621cbb15751ea92",
"assets/assets/images/p-5.png": "2b818f0cbdb39af27931ada8f9e26e48",
"assets/assets/images/p-6.png": "b68510f8985df8ebab97b98697e26b17",
"assets/assets/images/team-1.jpg": "a1f9c9c24a8e99a398fbfcf6621ad0e7",
"assets/assets/images/team-2.jpg": "7b64d294360d631a207df3919765ab61",
"assets/assets/images/team-3.jpg": "71c36cb4ebf3e1ff099f322bf7e2eb8c",
"assets/assets/images/team-4.jpg": "80b6e98cd48356a1b9b03cadebf69a5d",
"assets/assets/images/team-5.jpg": "6ed044ba13de0290cbee7d98a9ea0092",
"assets/assets/product/1.jpg": "12b44bdb4462d3751c5d5ed46e566f5c",
"assets/assets/product/10.jpg": "fc8f1b9d01666b60ea77d4faf9d977d5",
"assets/assets/product/11.jpg": "f8a6f86e5d2da34835d02ddca8fc8e7b",
"assets/assets/product/12.jpg": "572a6df4a007217987ada2e075b06d3e",
"assets/assets/product/13.jpg": "405d61918582a6e3bbe9843e62958d0f",
"assets/assets/product/14.jpg": "9c0ba20cf5b69c1dddce36f3f2f73784",
"assets/assets/product/2.jpg": "71875e1315b283247c3a35ee41b8f729",
"assets/assets/product/3.jpg": "48db48537752766051f8638688c06861",
"assets/assets/product/4.jpg": "1abfeb42496132e4a631a7ffb02008f0",
"assets/assets/product/5.jpg": "3afa2fa6ccdfa4cf5202d109c14129c0",
"assets/assets/product/6.jpg": "e3a802f68e155489a40c49a4ac5a939a",
"assets/assets/product/7.jpg": "8d46c2d2fe41f88aeb2c5c2e962027a9",
"assets/assets/product/715fyswna0l-sl1067--500x500.webp": "e9fb4bc94eb2b9121e3a49830b693ef6",
"assets/assets/product/8.jpg": "63de5243a1ab3d4c6e2476328c57f866",
"assets/assets/product/9.jpg": "cce9fcdd836221ad3d9c0cc18b616127",
"assets/assets/product/etmhb_512.webp": "d70b7cd47a53ef4480c4632fdc81e511",
"assets/assets/product/product-jpeg-500x500.webp": "5d4f5c614c288cff2bfbe1492feb4314",
"assets/assets/product/SAFAVIEH-Handmade-Allure-Angie-Modern-Floral-Wool-Rug.webp": "7561f9ebfec1e4c75bc3d3c0791fdf7e",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "cccbfa2f22c3ecf6a9966ab231f3142b",
"assets/NOTICES": "c61d9f81274743277d138e57fa9b6851",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "56afde0667b283dbeba8ad8c0f0ca7b4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d5824312309500a42d874e9c0f025f50",
"/": "d5824312309500a42d874e9c0f025f50",
"main.dart.js": "70807ed2d53bcc732c61effd75e8b34d",
"manifest.json": "1046394ca1d2d7fc9beb00b62118f232",
"version.json": "980547175e325fe622a3362b84d55b6a"};
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
