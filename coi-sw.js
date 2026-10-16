// Cross-origin isolation for a host that can't set headers (GitHub Pages).
//
// A threaded Web build needs SharedArrayBuffer, which a browser only hands
// to a cross-origin isolated page: COOP same-origin + COEP require-corp on
// the document. This worker adds both to every same-origin response it
// passes through, and caches nothing - unlike Godot's own PWA worker
// (progressive_web_app/ensure_cross_origin_isolation_headers), which only
// comes with its cache-first offline copy of the whole build.
// web/shell.html registers it, and reloads once, when threads are on and
// the page arrived without isolation. Cross-origin requests go straight
// through untouched: under require-corp they need CORS or CORP of their
// own, which the analytics beacon and the cloud Worker both send.

self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (event) => event.waitUntil(self.clients.claim()));

self.addEventListener('fetch', (event) => {
	const request = event.request;
	if (new URL(request.url).origin !== self.location.origin) {
		return;
	}
	if (request.cache === 'only-if-cached' && request.mode !== 'same-origin') {
		return;
	}
	event.respondWith(fetch(request).then((response) => {
		if (response.status === 0) {
			return response;
		}
		const headers = new Headers(response.headers);
		headers.set('Cross-Origin-Opener-Policy', 'same-origin');
		headers.set('Cross-Origin-Embedder-Policy', 'require-corp');
		return new Response(response.body, {
			status: response.status,
			statusText: response.statusText,
			headers: headers,
		});
	}));
});
